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
* [ChefDK](https://downloads.chef.io/chef-dk/) >= 0.6.0
    * `$ chef -v` 

You can save time by downloading and adding the virtual machine to Vagrant before the workshop. Make sure you are in the root directory of the project and run:
* `vagrant box add ubuntu/trusty64`

## EZ Ruby on Rails
Once you have installed the dependencies, fork this repository. (You can change the name of the repository in your settings, if you like.) Next, `git clone` your fork to your local machine and `cd` into that directory. From the root directory of your project execute the commands below:

    $ vagrant up
    $ vagrant ssh
    $ cd microwave-workspace
    $ bundle exec puma
See it on your browser at `http://localhost:4000`!

## License
MIT License (see [License](https://github.com/Microwave-MVC/microwave-rails/blob/master/LICENSE))
