import com.sample.Classified
import com.sample.Comment
import com.sample.Location
import com.sample.User

class BootStrap {

    def init = { servletContext ->
		try {
			Location locationOne = new Location(address:'Malappuram').save();
			Location locationTwo = new Location(address:'Cochin').save();
			new User(username: "Ashish", password: "password", location:locationTwo).save(failOnError: true);
			new User(username: "Prasoon", password: "password", location:locationOne).save(failOnError: true);
			new User(username: "Sathish", password: "password", location:locationOne).save(failOnError: true);
			new User(username: "Ranjith", password: "password", location:locationOne).save(failOnError: true);
			new User(username: "Rajesh", password: "password", location:locationOne).save(failOnError: true);
			new User(username: "Shameer", password: "password", location:locationTwo).save(failOnError: true);
			User sushanth = new User(username: "Sushanth", password: "password", location:locationTwo)
				.addToWishList(new Classified(heading:"Laptop for sale", description:"Compaq v4000 laptop for sale"))
				.save(failOnError: true);
			new Comment(text:"Sample comment", creator:sushanth).save(failOnError: true);
		} catch (Exception e) {
			throw e;
		}
    }
    def destroy = {
    }
}
