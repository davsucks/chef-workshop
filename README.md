# Chef Workshop
Welcome to our handy Chef workshop!

#### What you will get out of this setup
* Ruby 2.2 & Rails 4.2
* Postgres
* Puma Webserver
* Ubuntu 14.04 Vagrant box
* provisioned using Chef / Test Kitchen / Berkshelf

## Before you Begin
Please make sure you have downloaded the following before proceeding. You can check which versions you may have already installed by executing the commands below in your terminal.
* [Virtualbox](https://www.virtualbox.org/wiki/Downloads) >= 4.3.26
    * `$ vboxmanage -v`
* [Vagrant](https://www.vagrantup.com/downloads.html) >= 1.7.2
    * `$ vagrant -v`
* [ChefDK](https://downloads.chef.io/chef-dk/) >= 0.10.0
    * `$ chef -v`

You can save time by downloading and adding the virtual machine to Vagrant before the workshop. Make sure you are in the root directory of the project and run:
* `$ vagrant box add ubuntu/trusty64`

## Get acquainted with the code
Some initial code has been set up for you. This is a simple Ruby app that displays a congratulatory message once you're able to get it running. Our Chef code lives inside the `/cookbook` directory and all of the commands below should be executed in this directory. Take a moment to familiarize yourself with what lives there.

### Berkshelf
Berkshelf is a dependency manager for Chef. The cookbook we write will depend on cookbooks written by the Chef community. Berkshelf uses the `Berksfile` to determine what dependencies to fetch and where to fetch these dependencies from. Our dependencies will be listed in the `metadata.rb` file.

To verify that your `Berksfile` is set up correctly, you can run the following commands and make sure they execute without errors (nothing will be downloaded because we haven't specified any dependencies yet).

```
$ cd cookbook/
$ berks install
```

### Test Kitchen
To borrow directly from the Test Kitchen project, 'Test Kitchen is an integration tool for developing and testing infrastructure code and software on isolated target platforms'. The `kitchen` command line tool allows you to create virtual machines using Vagrant or another driver, upload your cookbook and its dependencies to that machine using Berkshelf, apply your cookbook using Chef, and then verify the state of the machine using a testing framework such as Serverspec.

We've already configured Test Kitchen for you. Take a look at the `.kitchen.yml` file to see for yourself.

A couple of interesting things to note:

```
platforms:
  - name: kitchen-box
    driver:
      box: ubuntu/trusty64
```

This section above allows us to test our cookbooks against multiple platforms, which is pretty neat! Here we are only working against the `ubuntu/trusty64` image for now, but we could considering adding a centos image in the future. A good Chef cookbook should be platform independent.

```
suites:
  - name: chef-workshop
    run_list:
      - chef-workshop-cookbook
```

The `suites` section of our `.kitchen.yml` file allows us to specify which cookbooks we want to run in a given suite. For now, we only have one suite, and it contains only one cookbook. As you can see, the name of the cookbook under the `run_list` must correspond with the name defined in our `metadata.rb` file. If a cookbook, rather than a specific recipe, is added to a runlist, the default recipe of the cookbook is run.

We will come back to how to use Test Kitchen to start writing your infrastructure code.

### Recipes
We have a pretty simple cookbook that only has one recipe in it for now, that we will use to provision everything we need for our Ruby on Rails app. Recipes are the fundamental unit of configuration in Chef, and should define everything that is required to configure part of a system.

Your recipe can depend on other recipes, whether they're yours or recipes from the Chef community. Some dependencies will require you to set some values as properties, and this configuration can be done in the `/attributes` directory.

## Your First Objective: install Ruby with Chef
Since we're building a Ruby app, we're going to need Ruby to be able to run it, right?

To do this, we'll need to set the [rbenv cookbook](https://supermarket.chef.io/cookbooks/rbenv/versions/1.7.1) as a dependency. Add the following line to the `metadata.rb` file:
`depends 'rbenv', '1.7.1'`

You'll notice that the cookbook says to put `cookbook 'rbenv', '~> 1.7.1'` if you are using Berkshelf, which we are. The `cookbook` convention is used if specifying dependencies directly in the `Berksfile`, but since we are putting them in a `metadata.rb` file, we use the `depends` convention instead.

Okay, so now we have the `rbenv` cookbook but we need to actually invoke some of its recipes to install Ruby -- just like real-life food recipes! Add the `rbenv::default` and `rbenv::ruby_build` recipes to our default recipe found in `/cookbook/recipes/default.rb`.

Once you've managed that, we're still not quite done. You might have noticed in the documention for the `rbenv` cookbook references to LWRPs, or Lightweight Resources and Providers. LWRPs are essentially like functions that allow you to define custom state. So, for example, we need to use the `rbenv_ruby` LWRP to tell Chef to build Ruby 2.2.2 for us as the global ruby version. Read the documentation and add the necessary lines to your recipe to make this happen.

### Verifying that Ruby was installed
Here is where the magic of Test Kitchen comes into play. First run `$ kitchen list` to view the status of your VM. It should say, 'Not Created'.

You can create the VM and apply your changes from your cookbook by running the commands below while in the `/cookbook` directory:

```
$ kitchen create
$ kitchen converge
```

`$ kitchen converge` will apply your `run_list` to a created instance. Any time you make a change to the recipe, just run this command. If you need to make a change to your `.kitchen.yml` file, however, you will need to destroy and recreate the VM for your changes to take effect.

#### Manual Testing
To manually check that Ruby was installed, you can execute `$ kitchen login` to ssh into the box, and run `$ ruby -v`. It should print `2.2.2` to the console -- if it doesn't, keep updating your recipe and converging until it works!

#### Integration Testing
You might have been wondering about that `/tests` directory. This directory contains a few integration tests that were already written for you to verify if Ruby was installed correctly. Once your VM has been converged with Kitchen, you can run `$ kitchen verify` to run the integration tests. Note that the integration tests should pass against a converged instance, and should fail against an unconverged instance.

### Installing Bundler
Now, you've installed Ruby, but you may have realized you won't be able to start your app quite yet. Try the following commands:

```
$ kitchen login
$ cd workspace
$ bundle exec puma
```

You should see an error that Bundler isn't installed! Using what you just learned about installing a new Ruby, use the appropriate LWRP to install the bundler gem. Trying writing a test to check that Bundler was installed correctly; see the [ServerSpec](http://serverspec.org/resource_types.html) documention for help.

Once you are successful, log in to the VM and run:

```
$ bundle install
$ bundle exec puma
```

Then you can navigate to `http://localhost:4000` in your browser to see the app. As a bonus exercise, you can try to add code to your recipe so that the `bundle install` command gets run automatically when you provision the VM.

## Your Second Objective: Test-Drive adding a Postgres Database
If you made it this far, nice work! Now you're going to try writing some tests of your own to verify you have installed Postgres correctly and set up a database for our app.

Take a look at the [ServerSpec](http://serverspec.org/resource_types.html) documentation to get a feel for the matchers that are available to you. Write a test to verify that the Postgres service is running after the instance is converged.

After you've seen the test fail, look at the documentation for the [Postgresql cookbook](https://supermarket.chef.io/cookbooks/postgresql). See if you can figure out how to set it up by using the right recipes and attributes and get your tests to pass!

## Good Job!
You've reached the end of this workshop. Give yourself a pat on the back! Keep on cookin' with Chef! :)

## License
This has been adapted from @ekcasey's Chef workshop. :)
MIT License (see [License](https://github.com/Microwave-MVC/microwave-rails/blob/master/LICENSE))
