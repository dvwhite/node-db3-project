function find() {
  return db("schemes");
}

function findById(id) {
  return db("schemes")
    .where({ id })
    .first()
    .then((res) => {
      return res !== undefined ? res : null;
    });
}
function findSteps(id) {
  return db("steps AS s")
    .select(["s.id", "s.step_number", "s.instructions", "schemes.scheme_name"])
    .where("s.scheme_id", id)
    .leftJoin("schemes", "s.scheme_id", "schemes.id");
}
