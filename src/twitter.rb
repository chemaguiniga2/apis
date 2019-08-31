# Observer Pattern
# Date: 31-Ago-2019
# Authors:
#          A01376669 José María Aguíñiga Díaz 
#          A01377566 José Rodrigo Narvaez Berlanga

# File name: twitter.rb

#Create a module of a user so that we can use a user functions at Twitter class.
module User
    #Initialize an empty array for the followers of an specific user.
    def initialize
        @followers=[]
    end
    #Adds at the end of the array a new user
    def followUser(userToFollow)
        @followers << userToFollow
    end
    
    def timeline(user, tweet)
        @followers.each {|follower| 
            follower.showNotifications(user, tweet)
        }
    end
end

class Twitter
    include User
    attr_reader :user
    
    def initialize(user)
        super()
        @user = user
    end
    
    def tweet(tweetMsg)
        timeline(self, tweetMsg)
    end
    
    def follow(follower)
        follower.followUser(self)
        self
    end
    
    def showNotifications(follower, tweet)
        puts "#{self.user} received a tweet from #{follower.user}: #{tweet}"
    end
    
    
end
