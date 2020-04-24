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
