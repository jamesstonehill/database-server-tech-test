# database-server-tech-test

This is my solution for a sample tech test that I did just to practice tech tests!

## The original brief for the test:

>"Before your interview, write a program that runs a server that is accessible on `http://localhost:4000/`. When your server receives a request on `http://localhost:4000/set?somekey=somevalue` it should store the passed key and value in memory. When it receives a request on `http://localhost:4000/get?key=somekey` it should return the value stored at `somekey`.
>
During your [mock] interview, you will pair on saving the data to a file."
>

## Notes on the solution

From the start, I wanted to keep this solution as simple as possible and as dependency light as possible. As such, the only gem required by this project is Sinatra.

I wanted a solution matched the simplicity of the brief and to have no GUI given that the primary use-case for a solution like this would probably be as some kind of back-end tool.

In terms of storing the key and value "in memory" I just used a global variable in the controller because it seemed the most straight-forward way of storing something in memory. Although this is not considered 'best practice' in conventional controllers, I think that it works in this case because the 'in memory' is only a stand-in for the database.

## Server Framework

For this project I chose to use Sinatra because it is very lightweight and flexible when compared to other Ruby frameworks like Rails.

I also wanted a framework because I thought that it would make integrating with the to be confirmed database easier/more familiar.

## Setting up the project locally

In order to setup this project on your machine all you need to do is clone this repo, and run `bundle install` in the repo directory.

### Running the project locally

run `ruby server.rb` from the command line in the root directory of this project. You can also run the program by running `rackup` as rack has also been configured to run on port 4000 for this project.

#### Notes on the Ruby version
The Ruby version specified in the Gemfile is 2.3.0 as this is the latest version widely used currently, but you can change which Ruby version you want to use by editing this version specifier and switching your Ruby version with RVM.

## Testing

Considering the lack of 'conventional' coding features (like complex logic or DOM objects), I decided not to use any headless browsers or fully-fledged testing frameworks (like RSpec). Instead I made use of Rack's [testing module](http://www.rubydoc.info/github/brynary/rack-test/Rack/Test/Methods), which obviously ships with Sinatra so it keeps the project's dependencies very light and Ruby's testing unit.


### Running the tests yourself
Once you have the project on your machine, in order to run the tests you just run `ruby server_spec.rb` from the command line in the project's root directory.
