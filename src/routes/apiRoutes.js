const router = require("express").Router();
const verifyJWT = require('../services/verifyJWT');
const userController = require("../controllers/userController");
const orgController = require("../controllers/orgController");
const eventoController = require('../controllers/eventoController');
const ingressoController = require("../controllers/ingressoController");

router.post("/user", userController.createUser);
router.get("/user", verifyJWT, userController.getAllUsers);
router.put("/user", userController.updateUser);
router.delete("/user/:id_usuario", userController.deleteUser);
router.post("/login", userController.loginUser);

router.post("/org", orgController.createOrg);
router.get("/org", orgController.getAllOrgs);
router.put("/org", orgController.updateOrg);
router.delete("/org/:id_organizador", orgController.deleteOrg);

//rotas eventoController
router.post('/evento', eventoController.createEvento);
router.get('/evento', verifyJWT, eventoController.getAllEventos);
router.put('/evento', eventoController.updateEvento);
router.delete("/evento/:id_evento", eventoController.deleteEvento);
router.get('/evento/data', eventoController.getEventosPorData);
router.get("/evento/:data", verifyJWT, eventoController.getEventos7Dias);

router.post('/ingresso', ingressoController.createIngresso);
router.get('/ingresso', ingressoController.getAllIngressos);
router.put('/ingresso', ingressoController.updateIngresso);
router.delete('/ingresso/:id', ingressoController.deleteIngresso);
router.get('/ingresso/evento/:id', ingressoController.getByIdEvento);

module.exports = router;
