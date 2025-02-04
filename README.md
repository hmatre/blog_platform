Project Overview

This is a simple blog platform built using Ruby on Rails and PostgreSQL, featuring user authentication, CRUD operations for blog posts, a comment system, tagging, and an admin dashboard. The project also includes basic analytics to track post views, reading time, and popular content.

🔧 Setup Instructions

1) Prerequisites

Ensure you have the following installed:

Ruby 3.x

Rails 8.x

PostgreSQL

Redis (for Sidekiq)

Bundler

2) Clone the Repository

git clone https://github.com/hmatre/blog_platform.git
cd blog_platform

3) Install Dependencies

bundle install
rails db:create db:migrate db:seed

4) Start the Application

rails server

Visit http://localhost:3000 in your browser.

5) Run Background Jobs (Sidekiq)

sidekiq

6️) Run Tests

rspec