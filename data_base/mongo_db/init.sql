db.createUser({
  user: "docker_admin",
  pwd: "d0ck3rp$$wrd",
  roles: [{ role: "readWrite", db: "mydb" }]
});