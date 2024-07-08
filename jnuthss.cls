\ProvidesClass{jnuthss}[2021/06/21]

\newif\ifjnuthss@master\jnuthss@masterfalse
\newif\ifjnuthss@doctor\jnuthss@doctorfalse
\DeclareOption{master}{\jnuthss@mastertrue}
\DeclareOption{doctor}{\jnuthss@doctortrue}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{ctexbook}}
\ProcessOptions\relax
% 处理选项信息。


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
% 基础格式。
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


\PassOptionsToPackage{quiet}{fontspec}
% 消除CJK字体警告。
\LoadClass[
    a4paper,
    openright,
    fontset    = ubuntu,
    zihao      = -4,
    linespread = 1.625,
    % LaTeX 1.625 倍行距约等于 Wrod 上 1.5 倍行距。
]{ctexbook}

% 12号字（小四）。
% Ubuntu 上中文默认思源宋体。

\RequirePackage{mathptmx}
% 数学公式字体 Times New Roman。
% \setmainfont{Times New Roman}
% 英文字体用 Times New Roman。


\setCJKfamilyfont{lishu}[Path = ./misc/]{simli.ttf}
\newcommand{\lishu}{\CJKfamily{lishu}}
% 配置首页要用到的隶书字体，因为 Ubuntu 是没有隶书字体的。





\setlength{\parskip}{0pt}




\RequirePackage{geometry}
% 页面布局宏包。
\geometry{
    left       = 2.5cm,
    right      = 2cm,
    top        = 2.5cm,
    bottom     = 2.25cm,
    headheight = 1.75cm,
    headsep    = 0.75cm,
    footskip   = 0.75cm,
}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 临时工具

%\RequirePackage{showframe}%显示边界。
%\RequirePackage[]{changes}%批注。
%\def\showfontsize{\csname f@size\endcsname pt}
%显示字体大小。







%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 图表、公式及引用
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{multicol}
% 分栏。
\RequirePackage{amsmath}
% 常用公式拓展宏包。



\RequirePackage{booktabs}
% 三线表。
\RequirePackage{graphicx}
% 插图。
\RequirePackage{tikz}
\usetikzlibrary{positioning}
% 子图编号定位。
\usetikzlibrary{patterns}
% 图案填充。
\RequirePackage{pgfplots}
\pgfplotsset{
    compat = newest,
    width  = 10cm,
    height = 8cm,
}


\pgfplotsset{
    every axis/.append style      = {line width = 1pt, font = \footnotesize},
    error bars/error bar style    = {line width = 1pt, solid},
    error bars/error mark options = {line width = 1pt, mark size = 2pt, rotate = 90}
}


\RequirePackage{siunitx}
% 物理单位宏包。
% 注：不同物理单位、数学字符等字体是不一样的，不能直接写进公式环境。
\sisetup{
    range-phrase = $\ \sim \ $,
    range-units  = single,
    % 修改范围中间符号为“~”，默认为“to”，且单位不重复。
    mode = text,
    % 字体同文本一样，Times New Roman。
    inter-unit-product = \ensuremath{{}\cdot{}}
    % 修改单位内部间隔符号为点乘，默认为小空格。
}



\fboxsep  = 0pt
% fbox 边框分割距离。
\fboxrule = 1.5pt
% fbox 边框线条宽度。




\RequirePackage{caption}
% 图片题注。
\captionsetup{
    size          = small,
    labelsep      = quad,
    justification = centering,
    aboveskip     = 6pt plus 3pt minus 3pt,
    belowskip     = 0pt plus 6pt minus 6pt,
}







\RequirePackage{enumitem}
\setlist{
    leftmargin    = 0pt,
    label         = (\arabic*),
    labelwidth    = 24pt,
    listparindent = 48pt,
    itemindent    = 48pt,
    nosep,
}
% % 列表环境。



\RequirePackage[sort&compress]{gbt7714}
% 参考文献 GBT7714-2015 规范宏包。

\RequirePackage[bookmarks,hidelinks]{hyperref}
% 引用，目录及链接有跳转。








%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
% 章节、目录及页眉页脚。
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%




\RequirePackage{tocloft}

\setcounter{tocdepth}{1}
% 只统计到节。

\renewcommand\cftaftertoctitleskip{-5em}
% 标题后跳-5em。


\renewcommand{\cftdot}{$\cdot$}
% 章节引导线设置为单个居中点，《要求》中的引导线太难看了，明知不完全一样也要拒绝。

\renewcommand\cftchapdotsep{1.5}
\renewcommand\cftsecdotsep{1.5}

\setlength{\cftsecindent}{0pt}
\setlength{\cftbeforechapskip}{12pt plus 2pt minus 2pt}


\renewcommand{\cftchapfont}{\mdseries}
\renewcommand{\cftchappagefont}{\mdseries}
% 目录中内容不加粗。

\let\origcftsecpagefont\cftsecpagefont
\let\origcftsecafterpnum\cftsecafterpnum
\let\origcftchappagefont\cftchappagefont
\let\origcftchapafterpnum\cftchapafterpnum
\renewcommand{\cftsecpagefont}{（\origcftsecpagefont}
\renewcommand{\cftsecafterpnum}{\origcftsecafterpnum）}
\renewcommand{\cftchappagefont}{（\origcftchappagefont}
\renewcommand{\cftchapafterpnum}{\origcftchapafterpnum）}
% 目录中页码加括号。




\ctexset{section = {
      format     = {\bfseries\zihao{4}},
      beforeskip = 36pt plus 9pt minus 9pt,
      afterskip  = 24pt plus 6pt minus 6pt,
      fixskip    = true,
     }
}
% 节标题。

\ctexset{subsection={
            format     = {\bfseries\zihao{-4}},
            beforeskip = 24pt plus 6pt minus 6pt,
            afterskip  = 12pt plus 2pt minus 2pt,
            fixskip    = true,
        }
}
% 小节标题。


\RequirePackage{fancyhdr}
% 调整页眉页脚宏包。
\RequirePackage{emptypage}
% 偶数空白页去掉页眉页脚。



\fancypagestyle{myfancy}{
    \fancyhf{}
    \renewcommand{\headrulewidth}{0.75pt}
    \chead{\zihao{-5}\thsstype}
    \cfoot{\zihao{-5}\thepage}
}

\fancypagestyle{plain}{
    \fancyhf{}
    \renewcommand{\headrulewidth}{0pt}
    \cfoot{\zihao{-5}\thepage}
}




\renewcommand\frontmatter{%
    \if@openright
        \cleardoublepage
    \else
        \clearpage
    \fi
    \@mainmatterfalse
    \pagenumbering{Roman}\pagestyle{plain}
    \ctexset{
        chapter = {
          name       = {},
          number     = {\arabic{chapter}},
          format     = {\centering\bfseries\zihao{-3}},
          beforeskip = 12pt,
          afterskip  = 36pt plus 9pt minus 9pt,
          fixskip    = true,
         }
    }
}
% 前置部分页码用罗马数字编号，仅页脚，无页眉。

\renewcommand\mainmatter{%
    \if@openright
        \cleardoublepage
    \else
        \clearpage
    \fi
    \@mainmattertrue
    \pagenumbering{arabic}\pagestyle{myfancy}
    \ctexset{
        chapter = {
          name       = {},
          number     = {\arabic{chapter}},
          format     = {\bfseries\zihao{-3}},
          beforeskip = 24pt,
          afterskip  = 36pt plus 9pt minus 9pt,
          fixskip    = true,
          pagestyle  = myfancy,
         }
    }
}
% 正文部分页码用阿拉伯数字编号，有页脚，有页眉。

















%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
% 首页。
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%





\ifjnuthss@master
    \newcommand{\thsstype}{暨南大学硕士学位论文}
\else
    \newcommand{\thsstype}{暨南大学博士学位论文}

\fi
% 硕博类型判断。


\newcommand\ctitle[1]{\def\jnuthss@value@ctitle{#1}}
\newcommand\etitle[1]{\def\jnuthss@value@etitle{#1}}

\renewcommand\author[1]{\def\jnuthss@value@author{#1}}

\newcommand\mentora[1]{\def\jnuthss@value@mentora{#1}}
\newcommand\mentoradegree[1]{\def\jnuthss@value@mentoradegree{#1}}
\newcommand\mentoratitle[1]{\def\jnuthss@value@mentoratitle{#1}}

\newcommand\mentorb[1]{\def\jnuthss@value@mentorb{#1}}
\newcommand\mentorbdegree[1]{\def\jnuthss@value@mentorbdegree{#1}}
\newcommand\mentorbtitle[1]{\def\jnuthss@value@mentorbtitle{#1}}

\newcommand\branch[1]{\def\jnuthss@value@branch{#1}}
\newcommand\major[1]{\def\jnuthss@value@major{#1}}
\newcommand\degreetype[1]{\def\jnuthss@value@degreetype{#1}}
% 个人信息定义。


\renewcommand\maketitle[1]{%
    
    \thispagestyle{empty}
    
    {\raggedright\lishu\zihao{-1}\thsstype\par}
    \vfill
    {\raggedright\zihao{-3}题名（中英对照）：\par}
    \vfill
    {
        \zihao{-3}\centering\bfseries
        \jnuthss@value@ctitle\par
        \vfill
        \jnuthss@value@etitle\par
    }
    \vfill
    {
        \raggedright\zihao{-3}
        \ifx\jnuthss@value@mentorb\@empty
            \begin{tabular}{@{} m{0.49\linewidth} @{} >{\bfseries}m{0.48\linewidth} @{}}
                作者姓名： & \makebox[4em][s]{\jnuthss@value@author} \\
            \end{tabular}
            \vfill
            \begin{tabular}{@{} m{0.49\linewidth} @{} >{\bfseries}m{0.48\linewidth} @{}}
                指导教师姓名及学位、职称： & \makebox[3em][s]{\jnuthss@value@mentora}\quad\jnuthss@value@mentoradegree \quad \jnuthss@value@mentoratitle \\
            \end{tabular}
            \vfill
            \begin{tabular}{@{} m{0.49\linewidth} @{} >{\bfseries}m{0.48\linewidth} @{}}
                学科、专业名称： & \jnuthss@value@branch\quad\jnuthss@value@major \\
            \end{tabular}
            \vfill
            \begin{tabular}{@{} m{0.49\linewidth} @{} >{\bfseries}m{0.48\linewidth} @{}}
                学位类型： & \jnuthss@value@degreetype \\
            \end{tabular}
            \vfill
            \begin{tabular}{@{} m{0.49\linewidth} @{} >{\bfseries}m{0.48\linewidth} @{}}
                论文提交日期： & \\
            \end{tabular}
            \vfill
            \begin{tabular}{@{} m{0.49\linewidth} @{} >{\bfseries}m{0.48\linewidth} @{}}
                论文答辩日期： & \\
            \end{tabular}
            \vfill
            \begin{tabular}{@{} m{0.49\linewidth} @{} >{\bfseries}m{0.48\linewidth} @{}}
                答辩委员会主席： & \\
            \end{tabular}
            \vfill
            \begin{tabular}{@{} m{0.49\linewidth} @{} >{\bfseries}m{0.48\linewidth} @{}}
                论文评阅人： & \\
            \end{tabular}
            \vfill
            \begin{tabular}{@{} m{0.49\linewidth} @{} >{\bfseries}m{0.48\linewidth} @{}}
                学位授予单位和日期： & \\
            \end{tabular}
        \else
            \begin{tabular}{@{} m{0.49\linewidth} @{} >{\bfseries}m{0.48\linewidth} @{}}
                作者姓名： & \makebox[3em][s]{\jnuthss@value@author} \\
            \end{tabular}
            \vfill
            \begin{tabular}{@{} m{0.49\linewidth} @{} >{\bfseries}m{0.48\linewidth} @{}}
                指导教师姓名及学位、职称： & \makebox[3em][s]{\jnuthss@value@mentora}\quad\jnuthss@value@mentoradegree \quad \jnuthss@value@mentoratitle \\
            \end{tabular}
            \vfill
            \begin{tabular}{@{} m{0.49\linewidth} @{} >{\bfseries}m{0.48\linewidth} @{}}
                \phantom{13em} & \makebox[3em][s]{\jnuthss@value@mentorb}\quad\jnuthss@value@mentorbdegree\quad\jnuthss@value@mentorbtitle \\
            \end{tabular}
            \vfill
            \begin{tabular}{@{} m{0.49\linewidth} @{} >{\bfseries}m{0.48\linewidth} @{}}
                学科、专业名称： & \jnuthss@value@branch\quad\jnuthss@value@major \\
            \end{tabular}
            \vfill
            \begin{tabular}{@{} m{0.49\linewidth} @{} >{\bfseries}m{0.48\linewidth} @{}}
                学位类型： & \jnuthss@value@degreetype \\
            \end{tabular}
            \vfill
            \begin{tabular}{@{} m{0.49\linewidth} @{} >{\bfseries}m{0.48\linewidth} @{}}
                论文提交日期： & \\
            \end{tabular}
            \vfill
            \begin{tabular}{@{} m{0.49\linewidth} @{} >{\bfseries}m{0.48\linewidth} @{}}
                论文答辩日期： & \\
            \end{tabular}
            \vfill
            \begin{tabular}{@{} m{0.49\linewidth} @{} >{\bfseries}m{0.48\linewidth} @{}}
                答辩委员会主席： & \\
            \end{tabular}
            \vfill
            \begin{tabular}{@{} m{0.49\linewidth} @{} >{\bfseries}m{0.48\linewidth} @{}}
                论文评阅人： & \\
            \end{tabular}
            \vfill
            \begin{tabular}{@{} m{0.49\linewidth} @{} >{\bfseries}m{0.48\linewidth} @{}}
                学位授予单位和日期： & \\
            \end{tabular}
        \fi
    }
    
    
    \thispagestyle{empty}
    \clearpage{\thispagestyle{empty}\cleardoublepage}
    
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
% 独创性声明及学位论文版权使用授权书。
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


\newcommand{\makestatement}[1]{

    \thispagestyle{empty}
    
    {
        \vspace*{1em}
        \centering\zihao{2}\textbf{独\quad 创\quad 性\quad 声\quad 明}\par
        \vspace{1em}
    }
    
    本人声明所呈交的学位论文是本人在导师指导下进行的研究工作及取得的研究成果。除了文中特别加以标注和致谢的地方外，论文中不包含其他人已经发表或撰写过的研究成
    果，也不包含为获得
    \underline{\hspace{8em}}
    或其他教育机构的学位或证书而使用过的材料。与我一同工作的同志对本研究所做的任何贡献均已在论文中作了明确的说明并表示谢意。
    
    \vspace{18pt}
    
    \begin{tabular}{@{}p{0.45\linewidth}p{0.45\linewidth}}
        学位论文作者签名： & 签字日期： \\
    \end{tabular}
    
    \vfill

    {
        \centering\zihao{2}\textbf{学位论文版权使用授权书}\par
        \vspace{1em}
    }
    
    本学位论文作者完全了解
    \underline{\hspace{9em}}
    有关保留、使用学位论文的规定，有权保留并向国家有关部门或机构送交论文的复印件和磁盘，允许论文被查阅和借阅。本人授权
    \underline{\hspace{9em}}
    可以将学位论文的全部或部分内容编入有关数据库进行检索，可以采用影印、缩印或扫描等复制手段保存、汇编学位论文。
    
    （保密的学位论文在解密后适用本授权书）
    
    \vspace{24pt}
    
    \begin{tabular}{@{}m{0.45\linewidth}m{0.45\linewidth}}
        
        学位论文作者签名：                     & 导师签名：                         \\
        签字日期：\qquad 年 \quad 月 \quad 日 & 签字日期：\qquad 年 \quad 月 \quad 日 \\
        学位论文作者毕业后去向：                  &                               \\
        工作单位：                         & 电\qquad 话：                    \\
        通讯地址：                         & 邮\qquad 编：                    \\
    \end{tabular}
    
    \vfill
    
    
    
    \thispagestyle{empty}
    \clearpage{\thispagestyle{empty}\cleardoublepage}
    
}