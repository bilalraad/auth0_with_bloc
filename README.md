# oauth_with_bloc

A new project created to try authentication with auth0 and BLOC state managment.

## Getting Started

First you need to create a file caleed const.dart in the data folder and paste this inside the folder you created:

```
//e.g. your-username.us.auth0.com
const AUTH0_DOMAIN = 'YOUR_AUTH0_DOMAIN';
const AUTH0_CLIENT_ID = 'YOUR_AUTH0_CLIENT_ID';

//NOTE: the package name shouldn't have spaces or underscores
const AUTH0_REDIRECT_URI = 'com.bilal.auth0withbloc://login-callback';
const AUTH0_ISSUER = 'https://$AUTH0_DOMAIN';

const CAT_API_KEY = "YOUR_CAT_API_KEY";
```

## To get these values, First:

### a - make an auth0 account [here](https://auth0.com/)

### b - After creating an Auth0 account, follow the steps below to set up an application:

> Go to the Applications section of your dashboard.

> Click on the "Create Application" button.

> Enter a name for your application (e.g., "Flutter Application").

> Finally, select Native as the application type and click the Create button.

Your application should have at least one enabled Connection. Click on the "Connections" tab on your application page and switch on any database or social identity provider (e.g., Google).

<img src="https://www.linkpicture.com/q/Screenshot-2021-11-03-214857.png" alt="Auth0 connections for Flutter apps" />

Finally, navigate to the "Settings" tab on your application page and set a callback URL in the _Allowed Callback URLs_ field. For this demo, your callback URL should be the following value:

`com.bilal.auth0withbloc://login-callback`
</br>
</br>

Use the values of Domain and Client ID from your Application settings as the values of `AUTH0_DOMAIN` and `AUTH0_CLIENT_ID`.

<img src="https://www.linkpicture.com/q/Screenshot-2021-11-03-211359.png" type="image" alt="Auth0 connections for Flutter apps" >

## Second

You need to get the cat api key, so you have to go to this [website](https://thecatapi.com/) and signup. Then you'll recive an email with the key, Use the key the you get as the value of `CAT_API_KEY`.

## Finaly

All you need to do now is to run the app ✨
