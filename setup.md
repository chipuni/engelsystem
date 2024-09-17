# Setup instructions

These instructions will set up an instance of `Engelsystem-FC` as HTTP on port 8080
on an Amazon instance. They do not include changes that were made, post-installation, 
to run it on port 443 as https.

## Create an EC2 instance

Go to AWS, then EC2, then Instances. Launch an instance with the following settings:

1. Give it any name.

2. Choose "Ubuntu Server 22.04 LTS (HVM), SSD Volume Type" as the Amazon Machine Image.

3. Architecture: 64-bit (x86)

4. Instance type: t2.micro (free tier eligible)

5. Get or create a key pair. Save the private and public keys!

6. Use a security group that allows TCP port 22 and 8080 traffic from the Internet.

7. Configure storage with 30 GiB gp2 root volume, not encrypted.

8. Launch the instance.

9. Keep track of the address of the server.

## Set up the instance

1. ssh into your server. The command will be something like `ssh -i ?????.pem ubuntu@ec2-??-???-???-???.compute-1.amazonaws.com`

2. In order to install docker, you need to update the software in your system. Here are the steps:

```
$ sudo apt-get update
$ sudo apt-get upgrade
```

Accept all defaults.

```
$ sudo apt-get install docker docker.io docker-compose
```

Accept all defaults.

```
$ sudo usermod -a -G docker ubuntu

$ sudo reboot
```

## Initialize the instance

Log back into the system.

1. Check that you have docker permission by typing `docker ps`

2. Start up Engelsystem with the command `./startup.sh`. This will take some time to complete.

3. Once the startup is finished, you can visit the webpage at 
http://ec2-??-???-???-???.compute-1.amazonaws.com:8080/login. 

4. The default user name is `admin` and the default password is `asdfasdf`.

5. Click on `admin` in the upper-right side, then choose `Settings`.

6. Under "Settings" is "Password". Click that.

7. Your old password remains `asdfasdf`. Enter a new password, then click "Save".

8. Click on the "Admin" menu in the middle of the top of the screen. Choose "Gofurtypes".

9. Click on the + to the right of the word "Gofurtypes". You will want 2 types: "Gofur" and "Requestor".

10. Click on the "Admin" menu in the middle of the top of the screen. Choose "Shift types".

11. Click on the + to the right of the word "Shift types". You will want 1 type: "Regular shift".

12. Click on the "Admin" menu in the middle of the top of the screen. Choose "Locations".

13. You will want at least 8 locations: "18+ panel", "Artist Alley", "Dance", "Dealer's Den", 
"Hospitality/Staff Feed", "Hydration Station", "Night Market", "Registration". There may be 
others!

14. Click on the "Admin" menu in the middle of the top of the screen. Choose "Grouprights".

15. Change the rights for "Shift Coordinator" to be the same as "Angel", except that it can also
do "admin\_shifts." So its group rights should be: admin\_shifts, angeltypes, faq.view, ical, login, 
logout, news, register, shifts\_json\_export, user\_myshifts, user\_settings, user\_shifts, view\_locations 

16. Try creating a gofur, and make sure that they have the basic information that they want.

17. Try creating a requestor. Log out, log back as "admin", give your requestor "Shift Coordinator"
rights, log out, log back as the requestor, and make sure that they can create a request.

18. Let everyone know that the service is up and ready!
