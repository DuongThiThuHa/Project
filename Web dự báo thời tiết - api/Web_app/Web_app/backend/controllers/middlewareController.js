const jwt = require('jsonwebtoken');

const middlewareController ={

    //xac minh token
    verifyToken:(req, res, next) =>{
        const token = req.headers.token;
        if(token){  
            const accessToken = token.split(" ")[1];
            jwt.verify(accessToken, process.env.ACCESS_TOKEN_SECRET,(err, user)=>{
                if(err){
                    res.status(403).json("token khong hop le");
                }
                req.user = user;
                next();
            });
        }
        else{
            res.status(401).json("ban chua dc xac thuc");
        }
    },

    verifyTokenAndAdminAuth:(req,res,next)=>{
        middlewareController.verifyToken(req, res, ()=>{
            if(req.user.id == req.params.id || req.user.admin){
                next();
            }
            else{
                res.status(403).json("ban khong duoc phep xoa");
            }
        })
    }
}

module.exports = middlewareController;