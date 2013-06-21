import com.sample.Classified
import com.sample.Comment
import com.sample.User

class BootStrap {

    def init = { servletContext ->
		try {
//			new User(username: "Ashish", password: "password").save(failOnError: true);
			new User(username: "Prasoon", password: "password").save(failOnError: true);
			new User(username: "Sathish", password: "password").save(failOnError: true);
			new User(username: "Ranjith", password: "password").save(failOnError: true);
			new User(username: "Rajesh", password: "password").save(failOnError: true);
			new User(username: "Shameer", password: "password").save(failOnError: true);
			User sushanth = new User(username: "Sushanth", password: "password")
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
