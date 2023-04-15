user = User.create(email: "ruth@stu", password: "pass1")
User.create(email: "stu@stu", password: "pass2")
User.create(email: "emi@stu", password: "pass3")
User.create(email: "libby@stu", password: "pass4")

activity = Activity.create(name: "swimming", user: user)
Activity.create(name: "running", user: user)
Activity.create(name: "cycling", user: user)

Item.create(name: "shorts", activity: activity)
Item.create(name: "knicks", activity: activity)
Item.create(name: "helmet", activity: activity)
