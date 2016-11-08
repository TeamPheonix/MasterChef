# WebApp

# Abstract
Masterchef is a recipe website where chefs and cooks of any type can share their secret ingredients and special formulas with other gourmets who are also interested in preparing meals in a social setting.  Social profiles may consist of their recipes, ratings, pictures, etc.   There will be a recipe rating system which awards points to users and “level ups” their profile, giving a sense of accomplishment.  Users with the most ‘points’ and recipes with the highest average rating will be featured on the sites home page.  Users will be able to subscribe to other users and receive notifications when new recipes are published, and able to bookmark specific recipes that they might want to cook, or as their favourites.  Ideally, we would eventually be able to monetize this through premium accounts, advertisements, and the Amazon Partner Program.

Masterchef’s competitors are other recipe sites but Masterchef is unique in that it is the only website which allows users to share their own recipes on top of viewing other people’s recipes.

# Rating and comments
The rating feature will be community-driven.  After cooking a recipe, a user can comment on it and leave a rating, along with how difficult it was to successfully create.  These comments will be appended to the bottom of a recipes page.

# Tagging
Users can “tag” their recipes, allowing users to find their food by searching via tags (eg: “vegan” or “Mexican”). Furthermore, users will be able to avoid finding food that has their allergies or against their preferred diet (e.g. vegan, vegetarian).

# APIs
Masterchef will incorporate social media APIs to allow users to share recipes they find interesting on popular websites.  Grocery shopping APIs (amazon, etc) will be used to allow users to easily procure ingredients needed for recipes at a discount.  We may also include captcha to avoid “bot spam” and rating manipulation.  

# User types
There will be various types of users, such as basic users, “verified” users, admins. “Verified” users are either professionally-known chefs or chefs that make significant contributions to the website itself. These accounts are only given “verified” status after admin consents. Admins will be able to “confirm” user's’’ recipe posts and check if they are “valid” recipes and not just trash-posting. They will also be able to edit posts (for example, editing vulgar languages) and other basic features.


# Sample stories:
Bob wants to share his secret family recipe with the rest of the world. After registering as a user on Masterchef, Bob is able to share his recipe with thousands of gourmet enthusiasts.

John is a college student on a budget. He wants to find recipes that are cheap but nutritious and delicious enough for him. He also has nut allergies. He will search tags such as “budget” or “nutritional” and disregard tags such as “contain nuts” and find various recipes that have these tags. He found lots of food with these tags and wants to try making a few of them in the future. He will be able to bookmark these recipes for the future.

Gordon is a celebrity chef looking to increase his online prestige.  With a verified account on Masterchef, he will always be in the spotlight and be exposed to all kinds of users across the internet.

Mary loves cooking and is looking for a place online to socialize with people with the same passion.  She is able to make a personal profile on Masterchef and interact with other users like her, and comment on other people’s recipes on how she loves their recipes.

Kate is a busy working mom who also loves to learn new recipes to treat her kids. Especially she has subscribed Bob’s page and continuously learned Bob’s new secret family recipes. She doesn’t have much time shopping due to full-time working; however, she could use Grocery Shopping API to purchase necessary ingredients to complete the dishes in a timely manner.

# Changelog Dev 0.1
IMPORTANT: Update database, I made changes to the TAGS database.
Every feature known has been merged.
- Merged feature/tags branch
- Edited MakeAdmin/MakeNormal to be visibile to admins only
- Base level set to 1,privilege to basic user (0), and points to 0
- Show username instead of user id in recipes
- Only show your own stuffs (recipes,tags, etc.) unless you're admin
- Toolbar (?) on top now have admin-only features
- Added tags - recipe (and relationship tags-recipe) relationship (many to many)


# Things to do in Dev 0.1
- Add search feature for admin to search all databases
- Add sessions to other pages
- Make websites look better (currently most of the pages are basic)
- Range of complexity for recipe should be discussed
- Better tags/recipe pages and relationship. Currently only optimized for Iteration 1, that is to pursue features.


