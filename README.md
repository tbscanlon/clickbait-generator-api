# Clickbait Generator API

Get the title for your next viral listicle using this one weird API!

## Project Spec

The Clickbait Generator is an API for retreiving a randomised text string that mimics the listicle titles used by the likes of Buzzfeed, The Huffington Post and Time. The generator can do the following:
- Join together a a random sentence prefix and suffix for output.
- Be accessed using a RESTful API. My hope is someone will use this useless API for something equally useless of their own.

There's also a web front-end, with the following features:
- Some documentation on how to use the API.
- A live demo, using AJAX to fetch a new title asynchronously.
- *Maybe* social media sharing buttons. We'll see if I get round to it.

## User Stories
```
As a User,
So that I can get a sentence suffix,
I would like to be able to retreive one from somewhere.
```

```
As a User,
So that I can get a sentence prefix,
I would like to be able to retreive one from somewhere.
```

```
As a User,
So that I can form a complete sentence,
I would like to be able to join a prefix and suffix together.
```

```
As a User,
So that I can have a very large number of possible sentences,
I would like to be able to have a random number inserted into the sentence.
```

```
As a User,
So that I can show my friends how ironic and cool I am,
I would like to be able to share my clickbait title over Twitter.
```

```
As a Developer,
So that I can access a clickbait title from anywhere,
I would like to be able to make a GET request to a route.
```

```
As a Developer,
So that I can use a clickbait title anywhere,
I would like to be able to get a title as a JSON object.
```
