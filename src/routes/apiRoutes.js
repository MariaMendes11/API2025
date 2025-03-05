const router = require("express").Router();

const userController = require("../controllers/userController");
const orgController = require("../controllers/orgController");
const eventoController = require('../controllers/eventoController');
const ingressoController = require("../controllers/ingressoController");

router.post("/user", userController.createUser);
router.get("/user", userController.getAllUsers);
router.put("/user", userController.updateUser);
router.delete("/user/:id_usuario", userController.deleteUser);
router.post("/login", userController.loginUser);

router.post("/org", orgController.createOrg);
router.get("/org", orgController.getAllOrgs);
router.put("/org", orgController.updateOrg);
router.delete("/org/:id_organizador", orgController.deleteOrg);

//rotas eventoController
router.post('/evento', eventoController.createEvento);
router.get('/evento', eventoController.getAllEventos);
router.put('/evento', eventoController.updateEvento);
router.delete('/evento/:id', eventoController.deleteEvento);
router.get('/evento/data', eventoController.getEventosPorData);
router.get("/evento/:data", eventoController.getEventos7Dias);

router.post('/ingresso', ingressoController.createIngresso);
router.get('/ingresso', ingressoController.getAllIngressos);
router.put('/ingresso', ingressoController.updateIngresso);
router.delete('/ingresso/:id', ingressoController.deleteIngresso);

module.exports = router;
