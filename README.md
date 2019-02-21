# Public Key Infrastructure (PKI)


Read about PKI in [wiki]

[wiki]: https://en.wikipedia.org/wiki/Public_key_infrastructure

## Why PKI ?

As internet grows and devices communicate with each other, there arose a requirement for a secure communication between 
devices so that the data which passes through the internet cannot not be mis-used if intercepted. 

E.g., 

**https**

On opening any website and if it starts with _https_ like https://www.sample_site.com, it means that the website
uses [encryption]  which means any information sent through the website is scrambled and anybody who intercepts the information 
cannot view the actual information.

**http**

On the other hand, if a website starts with _http_ like http://www.oh-my-gosh.com, any information which is sent through the
network is not encrypted and anybody like your ISPs can easily see the data that is transmitted which can lead to [spoofing].


So it is always good to check if the web pages where you enter sensitive information like Username/password, addresses, credit 
card information have _https_ in the URL bar


[encryption]: https://en.wikipedia.org/wiki/Encryption
[spoofing]: https://en.wikipedia.org/wiki/Man-in-the-middle_attack

The PKI is a framework that defines a standard for providing https where 's' stands for 'secured'.