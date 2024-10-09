const authController = require("../controllers/authController");
const middlewareController = require("../controllers/middlewareController");

const router = require("express").Router();
//route dang ky
router.post("/register", authController.registerUser);
//route dang nhap
router.post("/login",authController.loginUser);
//route refresh
router.post("/refresh",authController.requestRefreshToken);
//route dang xuat
router.post('/logout',middlewareController.verifyToken,authController.userlogout);

module.exports = router;