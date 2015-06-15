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
Once you have installed the dependencies, fork this repository. (You can change the name of the repository in your settings.) Next, `git clone` your fork to your local machine. From the root directory of your project execute the commands below:

    $ vagrant up
    $ vagrant ssh
    $ cd microwave-workspace
    $ bundle exec puma
See it on your browser at `http://localhost:4000`!

## Go Live!
You'll need a Heroku account to deploy your app. When you're ready, hit the button to go live!

[![Deploy](https://www.herokucdn.com/deploy/button.png)](https://heroku.com/deploy)

## Authors
Copyright 2015 Valerie Roske (@valerie-roske).

## License
MIT License (see [License](https://github.com/Microwave-MVC/microwave-rails/blob/master/LICENSE))
