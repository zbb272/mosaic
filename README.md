# README

Mosaic Project
  - Picture sharing and liking application.

  Models:
    - User
    - Post
    - Tag
    - PostsTag
    - Comment
    - Like

  Associations:
    - User -< Posts &&
      User -< Comments &&
      User -< Likes
    - Post -< Tags through PostsTag &&
      Post -< Comments &&
      Post -< Likes
    - Tag  -< Posts through PostsTag

  Notes:
    - when logged in, landing page defaults to a grid of Posts
    that are recommended for the user
    


  Git workflow for this project:
    - Checkout 'your-name' branch
    - Make changes
    - Add changes made to git
    - Commit changes
    - Checkout local master branch
    - Pull from master branch on cloud
    - Merge 'your-name' branch with local master branch
    - Resolve merge conflicts
    - Make sure it is working
    - Push up to master branch on cloud
