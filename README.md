# README

Requirements:

A landing page with a form to create a short link.

Each short link should be unique and case-insensitive.

The short link takes you to the intended URL.

Other considerations:
It should have some level of visual aesthetic. Your call how far to take that, but at least something more than black text on a white screen.

No auth is necessary.
 * None required

Your choice of tech stack (language(s), framework(s), database, etc). All we need is a rationale for why you chose that stack, and any trade-offs you considered.
* Using Ruby on Rails for both backend and frontend due to time constraints as well as my experience level with other frontend frameworks.  This project requires a landing page instead of a mobile app screen in which I would have used React-Native. 
  My prefered platform would have been React but my limited experience with it prevents its use in this project. Additionally we will use postgresql, not only is it what I am most familiar with but we will use the auto generated ids to help address one of the main project concerns. 
		
Should the short links expire (and how?) or live forever? What are the downsides to your choice?
* Yes links should expire if the destination is not valid.  How likely is the destination going to change? Obviously we have no control over that, but we do have the ability to check the destination. So create a rake job that runs every 30 days and checks the destination links if 404 then delete the short link record.  The downside to this is that we will need to check all of the links, and as the DB size grows so will the time required to process this job. If outgoing requests from the server incur charges this could get expensive. 

What happens when someone visits an incorrect (or expired) short link?
* They should be directed to a page that tells them the link has expired or did not exist. With instructions as what to do next. 

Will the design scale to handle millions of links?
* As long as we can keep the generated urls short then yes. 

How do you generate the short link and why is this a good approach?
* The whole point is make links not only unique but short. After doing a bit of research I find the best approach to be to use the auto generated postgresql ids and convert them to a base 36 representation. When considering how to keep the short links unique and short as the number of records grow this combination seems to solve both problems at once. The downside here is I will need to create the link record then update it with the short link directly after. Which is two hits to the DB, but as these are save calls and not intense searches for lots of records response time should not be too bad. 

It shouldn't be possible for someone to "overwrite" an existing short link.
* So no update method then. 

If you were part of a team that spent a year on this, how might it be different from this quick-and-dirty implementation?

* Change out the frontend to use React
	Using React components and some animation improve user experience and UI

* React Native for Mobile version 

* Discuss implementation of banner and/or interstitial ads - we are not running a charity here, or are we? 

* Track popular and trending links with daily, weekly, monthly and yearly most linked to sites. 

* Details page for links that show graphs for number of visits over time as well as other information we can make available about the links use. 

* Generated link should be highlighted for you for easier copying or include a button to copy to clipboard. 

