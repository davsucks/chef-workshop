# microwave-rails
Microwave MVC provides cross-platform-compatible templates for different tech stacks so you can quickly get started with web development. Whether you're on Windows, Linux, or Mac, no more fussing with configuration for hours -- just ready, set, Rails!

#### What you get out of this Microwave
* Ruby 2.2 & Rails 4.2
* Postgres
* Puma Webserver
* Ubuntu 14.04 Vagrant box
* provisioned using Chef / Test Kitchen / Berkshelf
* optimized for deployment to Heroku

#### Dependencies
Please make sure you have downloaded the following before proceeding. You can check which versions you may have already installed by executing the commands below in your Terminal.
* [Virtualbox](https://www.virtualbox.org/wiki/Downloads) >= 4.3.26
    * `$ vboxmanage -v`   
* [Vagrant](https://www.vagrantup.com/downloads.html) >= 1.7.2
    * `$ vagrant -v` 
* [ChefDK](https://downloads.chef.io/chef-dk/) >= 0.6.0
    * `$ chef -v` 

## EZ Ruby on Rails
Once you have installed the dependencies, fork this repository. (You can change the name of the repository in your settings, if you like.) Next, `git clone` your fork to your local machine and `cd` into that directory. From the root directory of your project execute the commands below:

    $ vagrant up
    $ vagrant ssh
    $ cd microwave-workspace
    $ bundle exec puma
See it on your browser at `http://localhost:4000`!

## Go Live!
You'll need a Heroku account to deploy your app. When you're ready, hit the button to go live!

[![Deploy](https://www.herokucdn.com/deploy/button.png)](https://heroku.com/deploy)

## Next Steps
Now that you have successfully made a copy of this project and deployed it to Heroku for the first time, you can continue to develop your Rails app. To push new changes to your Heroku app, you will need to add the git remote:

      $ git remote add heroku git@heroku.com:YOUR-REPO-NAME.git 
You will only need to do this once. From then on, you will be able to do `$ git push heroku master` to deploy any new changes. For more information, here are some resources to get you started:
* [Rails Guides](http://guides.rubyonrails.org/getting_started.html)
* [Heroku Dev Center](https://devcenter.heroku.com/)

## Authors
Copyright 2015 Valerie Roske (@valerie-roske).

## License
MIT License (see [License](https://github.com/Microwave-MVC/microwave-rails/blob/master/LICENSE))
