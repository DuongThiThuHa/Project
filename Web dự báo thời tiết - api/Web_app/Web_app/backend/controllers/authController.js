const User = require("../models/User");
const bcrypt = require('bcrypt');
const jwt = require("jsonwebtoken");

let refreshTokens =[];

const authController ={
    //dang ky
    registerUser: async(req,res) => {
        try {
            const salt = await bcrypt.genSalt(10);
            const hashed = await bcrypt.hash(req.body.password, salt);

            // Tao user moi
            const newUser = await new User({
                username: req.body.username,
                email: req.body.email,
                password:hashed,
            });

            //save vao db
            const user = await newUser.save();
            res.status(200).json(user);
            
        } catch (error) {
            
            res.status(500).json(err);
        }
    },
    //tao accesstoken
    genarateAccessToken:(user)=>{
        return jwt.sign({
            id: user.id,
            admin: user.admin
        },
        process.env.ACCESS_TOKEN_SECRET,
        {expiresIn: "1h"}
        );
    },
    genarateRefreshToken:(user)=>{
        return jwt.sign({
            id: user.id,
            admin: user.admin
        },
        process.env.REFRESH_TOKEN_SECRET,
        {expiresIn: "365d"});
    },

    //dang nhap
    loginUser: async(req, res) =>{
        try {

            const user = await User.findOne({username: req.body.username});
            if (!user) {

                res.status(404).json("sai username!");
                
            }
            const validPassword = await bcrypt.compare(
                req.body.password,
                user.password
            );
            if(!validPassword){
                res.status(404).json("sai mat khau!");
            }
            if(user && validPassword){
               const accessToken= authController.genarateAccessToken(user);
                const refreshToken = authController.genarateRefreshToken(user);
                refreshTokens.push(refreshToken);
                res.cookie('refreshToken', refreshToken, {
                    httpOnly: true,
                    secure:false,
                    path:'/',
                    sameSite:'strict',
                } )
                const {password, ...others} = user._doc;
                res.status(200).json({...others, accessToken});
            }
            
        } catch (error) {
            res.status(500).json(err);
            
        }
    },

    requestRefreshToken: async(req, res)=>{
        //lay refresh token tu user
        const refreshToken = req.cookies.refreshToken;
        if(!refreshToken) return res.status(401).json("ban chua dn");
        if(!refreshTokens.includes(refreshToken)){
            return res.status(403).json("refresh token is not valid");
        }
        jwt.verify(refreshToken, process.env.REFRESH_TOKEN_SECRET,(err, user)=>{
            if(err){
                console.log(err);
            }
            refreshTokens = refreshTokens.filter((token) => token!== refreshToken);
            //tao access, refresh token moi 
            const newAccessToken = authController.genarateAccessToken(user);
            const newRefreshToken = authController.genarateRefreshToken(user);
            refreshTokens.push(newRefreshToken);
            // luu vao cookie

            res.cookie('refreshToken', newRefreshToken, {
                httpOnly: true,
                secure:false,
                path:'/',
                sameSite:'strict',
            });
            res.status(200).json({accessToken: newAccessToken});

        });
    },

    //Dang xuat
    userlogout: async(req, res) =>{
        res.clearCookie("refreshToken");
        refreshTokens = refreshTokens.filter(token => token !== req.cookies.refreshToken);
        res.status(200).json('dang xuat thanh cong');
    }
};
module.exports = authController;