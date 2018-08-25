# README

<p><span style="font-weight: 400;">Requirements:</span></p>
<ul>
<li style="font-weight: 400;"><strong>A landing page with a form to create a short link.</strong>
<ul>
<li style="font-weight: 400;"><span style="font-weight: 400;">starting a local server localhost:3000/links</span></li>
</ul>
</li>
<li style="font-weight: 400;"><strong>Each short link should be unique and case-insensitive.</strong>
<ul>
<li style="font-weight: 400;">checked</li>
</ul>
</li>
<li style="font-weight: 400;"><strong>The short link takes you to the intended URL.</strong>
<ul>
<li style="font-weight: 400;">checked</li>
</ul>
</li>
</ul>
<p>&nbsp;</p>
<p><strong>Other considerations:</strong></p>
<ul>
<li style="font-weight: 400;"><strong>It should have <em>some</em> level of visual aesthetic. Your call how far to take that, but at least something more than black text on a white screen.</strong>
<ul>
<li style="font-weight: 400;">Background image is of actual view from where the work was completed. Boca Chika Dominican Republic.</li>
</ul>
</li>
<li style="font-weight: 400;"><strong>No auth is necessary.</strong></li>
</ul>
<p><span style="font-weight: 400;">None required</span></p>
<ul>
<li style="font-weight: 400;"><strong>Your choice of tech stack (language(s), framework(s), database, etc). All we need is a rationale for why you chose that stack, and any trade-offs you considered.</strong>
<ul>
<li style="font-weight: 400;">
<p>Using Ruby on Rails for both backend and frontend due to time constraints as well as my experience level with other frontend frameworks. &nbsp;This project requires a landing page instead of a mobile app screen in which I would have used React-Native.</p>
<p>My prefered platform would have been React but my limited experience with it prevents its use in this project. Additionally we will use postgresql, not only is it what I am most familiar with but we will use the auto generated ids to help address one of the main project concerns.</p>
</li>
</ul>
</li>
</ul>
<ul>
<li style="font-weight: 400;"><strong>Should the short links expire (and how?) or live forever? What are the downsides to your choice?</strong>
<ul>
<li style="font-weight: 400;">Yes links should expire if the destination is not valid. How likely is the destination going to change? Obviously we have no control over that, but we do have the ability to check the destination. So to handle this I will use scheduler.rake create a job that can be scheduled to run every 30 days and checks the destination links, if 404 then delete the link record.&nbsp; Heroku scheduler add on will track the timeing of the job should this project need to be deployed. The downside to this is that we will need to check all of the links, and as the DB size grows so will the time required to process this job. If outgoing requests from the server incur charges this could get expensive.</li>
</ul>
</li>
</ul>
<p>&nbsp;</p>
<ul>
<li style="font-weight: 400;"><strong>What happens when someone visits an incorrect (or expired) short link?</strong>
<ul>
<li style="font-weight: 400;">They are directed to a page that tells them the link has expired or did not exist. With instructions as what to do next.</li>
</ul>
</li>
</ul>
<p>&nbsp;</p>
<ul>
<li style="font-weight: 400;"><strong>Will the design scale to handle millions of links?</strong>
<ul>
<li style="font-weight: 400;">As long as we can keep the generated urls short then yes.</li>
</ul>
</li>
</ul>
<p>&nbsp;</p>
<ul>
<li style="font-weight: 400;"><strong>How do you generate the short link and why is this a good approach?</strong>
<ul>
<li style="font-weight: 400;">The whole point is make links not only unique but short. After doing a bit of research I find the best approach to be to use the auto generated postgresql ids and convert them to a base 36 representation. When considering how to keep the short links unique and short as the number of records grow this combination seems to solve both problems at once. The downside here is I will need to create the link record then update it with the short link directly after. Which is two hits to the DB, but as these are save calls and not intense searches for lots of records response time should not be too bad.</li>
<li style="font-weight: 400;"></li>
</ul>
</li>
<li style="font-weight: 400;"><strong>It shouldn't be possible for someone to "overwrite" an existing short link.</strong>
<ul>
<li style="font-weight: 400;">So no update method or edit links then.</li>
</ul>
</li>
</ul>
<p>&nbsp;</p>
<ul>
<li style="font-weight: 400;"><strong>If you were part of a team that spent a year on this, how might it be different from this quick-and-dirty implementation?</strong>
<ul>
<li style="font-weight: 400;">
<p>Change out the frontend to use React</p>
<p>Using React components and some animation improve user experience and UI</p>
<p>Main url validatation to prevent bad links from being entered in the first place.</p>
<p>React Native for Mobile version&nbsp;</p>
<p>Discuss implementation of banner and/or interstitial ads - we are not running a charity here, or are we?</p>
<p>Track popular and trending links with daily, weekly, monthly and yearly most linked to sites.&nbsp;</p>
<p>Details page for links that show graphs for number of visits over time as well as other information we can make available about the links use.</p>
<p>Generated link should be highlighted for you for easier copying or include a button to copy to clipboard.</p>
<p>Update the base URL in the forms with an environmental variable that can be set in a yaml file.</p>
</li>
</ul>
</li>
</ul>
