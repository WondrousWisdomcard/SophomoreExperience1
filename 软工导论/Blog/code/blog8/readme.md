## 项目简介: C语言版贪吃蛇

玩法：

给定一个10*10的字符矩阵表示蛇的生存空间,其中有一条长度5的蛇(HXXXX), “H”表示蛇头,“X”表示蛇身体。空间中可能有食物（“$”表示）和障碍物（“*”表示）

你可以使用“ADWS”按键分别控制蛇的前进方向“左右上下”, 当蛇头碰到自己的身体或走出边界,游戏结束,否则蛇按你指定方向前进一步。

## 文件内容

snake_move.c 为第一版，蛇可以通过W A S D四个按键依次进行 上 左 下 右的移动，蛇的长度不会改变，“界面”如下图：

    NEXT DIRECTION: D
    ************
    *     XXXXH*
    *          *
    *          *
    *          *
    *          *
    *          *
    *          *
    *          *
    *          *
    *          *
    ************
    The snake hit the wall!!!
    Game Over!!!
    The snake has 5 meter long!

snake_eat.c 为第二版，地图会随机生成食物，蛇吃下后身体会变长：

    NEXT DIRECTION: S
    ************
    *     $    *
    *          *
    *          *
    *          *
    *     $  X *
    *       $X *
    *  $ XXXXX *
    *    H  $  *
    *          *
    *$         *
    ************

## 功能特性

1. 蛇的移动
2. 食物生成
3. 地图呈现
4. 游戏结束界面
5. 初始地图生成
   