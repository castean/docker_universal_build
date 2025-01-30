db.createUser({
  user: "docker_admin",
  pwd: "d0ck3rpsswrd",
  roles: [{ role: "readWrite", db: "mydb" }]
});