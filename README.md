Octopress Goodreads Status
=====================

Octopress Aside for displaying Goodreads status

---------------------------------------------------
### Installation

1. Copy the files to your Octopress directory
1. Obtain your Goodreads ID

  <sup>Login to Goodreads and click on your profile -- the ID needed for the plugin is number-username combo that follows http://www.goodreads.com/user/show/ in the URL. The ID should look like `8988247-ryan`</sup>

1. Modify the goodreads.html aside that you recently moved into your Octopress install and replace `{YOUR_GOODREADS_ID}` with the ID you obtained in the previous step. Keep in mind that anyone can view your Goodreads status (although, that seems to be the desired outcome of using this plugin)

1. In the same goodreads.html aside replace `{MAXRESULTS}` with the maximum number of results you wish to display. Your aside should contain something that looks like this: `{% goodreads 8988247-ryan|3%}`
1. Generate your site and verify everything is working as desired and deploy as normal

--------------------------------------------------
### License and Disclaimer
You are free to use/modify/redistribute this plugin as you see fit. The only thing I ask is that you consult the [Goodreads Terms and Conditions](http://www.goodreads.com/api/terms) before making any changes with how the data is displayed.

Use the following Octopress plugin at your own risk. Although I don't forsee this causing any problems, I take no responsibility in any way for anything that happens as a result of using this code.
