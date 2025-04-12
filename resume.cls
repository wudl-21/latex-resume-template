\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{resume}

\makeatletter
% ┏━━━━━━━━━━━━━━━━━━━━━┓
% ┃         选项        ┃
% ┗━━━━━━━━━━━━━━━━━━━━━┛
%% 语言
\newif\if@UsingEnglish   % [布尔变量] 是否 (默认) 使用英语
\DeclareOption{zh}      % 使用中文
{
    \@UsingEnglishfalse
    \PassOptionsToPackage{scheme=chinese}{ctex} % 用 ctex 宏包汉化文档结构
}
\DeclareOption{en}      % 使用英语
{
    \@UsingEnglishtrue
    \PassOptionsToPackage{scheme=plain}{ctex}   % 阻止ctex宏包过度汉化
}
\ProcessOptions\relax

% 其余变量传递给 article 类
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax

\LoadClass[a4paper]{article}   % 加载article类
%%━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━


% ┏━━━━━━━━━━━━━━━━━━━━━┓
% ┃       调用宏包      ┃
% ┗━━━━━━━━━━━━━━━━━━━━━┛
\RequirePackage[UTF8]{ctex} % 中文支持
\RequirePackage{fix-cm}     % CM字体修正，允许使用非标准字号
\RequirePackage{xparse}       % 复杂命令定义
\RequirePackage{kvoptions}    % 键值对解析
\RequirePackage{enumitem}     % 列表控制
\RequirePackage{etoolbox}     % 条件判断
\RequirePackage{geometry}     % 页面布局
\RequirePackage{hyperref}     % 超链接
\RequirePackage{array}        % 表格布局
\RequirePackage{titlesec}     % 标题格式
\RequirePackage{fontspec}     % 字体设置
\RequirePackage{graphicx}   % 图片插入
\RequirePackage{setspace}     % 行间距设置
\RequirePackage{fontscale}   % 字体缩放

% ━━━━━━━ 页面布局 ━━━━━━━
\geometry{
    top=0.5in,
    bottom=0.5in,
    left=0.5in,
    right=0.5in,
    headheight=0pt,
    footskip=0pt
}
\pagestyle{empty}                    % 隐藏页眉页脚


% ┏━━━━━━━━━━━━━━━━━━━━━┓
% ┃      自定义命令     ┃
% ┗━━━━━━━━━━━━━━━━━━━━━┛
% ━━━━━━━ 日期格式转换 ━━━━━━━
\input{command/date}
% ━━━━━━━ 交集检查 ━━━━━━━
\input{command/check_intersection} % 检查两个逗号分隔列表是否有交集的辅助命令


% ┏━━━━━━━━━━━━━━━━━━━━━┓
% ┃       键值设定      ┃
% ┗━━━━━━━━━━━━━━━━━━━━━┛
% ━━━━━━━ 布局设定 ━━━━━━━
\SetupKeyvalOptions{
    family=layoutinfo,
    prefix=LayoutInfo@
}
% 定义键名（字符串类型）
\DeclareStringOption[1.0]{lineSpacing}
\DeclareStringOption[1.0]{tableLineSpacing}
\DeclareStringOption[0cm]{indent}
\DeclareStringOption[1em]{paragraphSpacing}
\DeclareStringOption[2pt]{moduleSpacing}
\DeclareStringOption[4pt]{expSpacing}
% 设置默认值
\setkeys{layoutinfo}{}
% 定义布局命令
\newcommand{\LayoutInfo}[1][]{%
    \setkeys{layoutinfo}{#1}%
    % 应用参数
    \setstretch{\LayoutInfo@lineSpacing}
    \renewcommand{\arraystretch}{\LayoutInfo@tableLineSpacing}
    \setlength{\parindent}{\LayoutInfo@indent}
    \setlength{\parskip}{\LayoutInfo@paragraphSpacing}
}

% ━━━━━━━ 字体设定 ━━━━━━━
\SetupKeyvalOptions{
    family=fontinfo,
    prefix=FontInfo@
}
\DeclareStringOption[10pt]{normalSize} % 基础字号
\DeclareStringOption[1.2]{baselineSkipScale} % 基线间距缩放
\DeclareStringOption[1.2]{titleScale} % 文头字号缩放
\DeclareStringOption[1.5]{sectionScale} % 模块标题字号缩放
\DeclareStringOption[SFMonoSC]{monoFont}
\DeclareStringOption[HelveticaNeue]{sansFont}
\DeclareStringOption[FZHei]{sansCJKFont}
\DeclareStringOption[SFMonoSC]{monoCJKFont}
% 设置默认值
\setkeys{fontinfo}{}

\newcommand{\FontInfo}[1][]{
    \setkeys{fontinfo}{#1} % 应用参数

    % 设置字体
    \setmonofont{\FontInfo@monoFont}      % 设定等宽字体
    \setsansfont{\FontInfo@sansFont}  % 设定无衬线字体
    \setCJKsansfont{\FontInfo@sansCJKFont}[ % 中文无衬线字体
        AutoFakeSlant = 0.15    % 伪斜体修正（可选）
    ]
    \setCJKmonofont{\FontInfo@monoCJKFont}[ % 中文等宽字体
        AutoFakeSlant = 0.15    % 伪斜体修正（可选）
    ]
    \fontscalesetup{
        normalsize/size = \FontInfo@normalSize, % 使用基础字号比例
        baselineskip-size-ratio = \FontInfo@baselineSkipScale, % 行距比例
        typographic-scale = musical, % 使用音乐音阶比例 
    }
}

% ━━━━━━━ 图片路径设定 ━━━━━━━
\SetupKeyvalOptions{
    family=figinfo,
    prefix=FigInfo@
}
% 定义键名（字符串类型）
\DeclareStringOption[./img/]{path}
% 定义布局命令
\newcommand{\FigInfo}[1][]{%
    \setkeys{figinfo}{#1}%
    % 应用参数
    \graphicspath{\FigInfo@path}
}
% 设置默认值
\setkeys{figinfo}{}

% ━━━━━━━ 岗位类型设定 ━━━━━━━
\SetupKeyvalOptions{
    family=jobinfo,
    prefix=JobInfo@
}
\DeclareStringOption[]{name}
\DeclareStringOption[]{type}
\if@UsingEnglish
    \DeclareStringOption[Job Target:]{caption}
\else
    \DeclareStringOption[意向职位：]{caption}
\fi
\setkeys{jobinfo}{}

\NewDocumentCommand{\JobInfo}{O{}}{
    \setkeys{jobinfo}{#1}
}

% ━━━━━━━ 个人信息 ━━━━━━━
\SetupKeyvalOptions{
    family=profile,
    prefix=Profile@
}
\DeclareStringOption[]{name}
\DeclareStringOption[]{contactFirst}
\DeclareStringOption[]{contactSecond}
\DeclareStringOption[]{contactThird}
\DeclareStringOption[]{link}
\DeclareStringOption[]{photo}
\setkeys{profile}{}

\NewDocumentCommand{\MakeProfile}{O{}}{
    \begingroup
    \setkeys{profile}{#1}
    \noindent
    \begin{minipage}[c]{\ifdefvoid{\Profile@photo}{1\textwidth}{0.75\textwidth}}
        {\scalefont{\FontInfo@titleScale}\sffamily\Profile@name}

        \vspace{0.5em}

        \ifdefvoid{\JobInfo@name}{}{{\sffamily\JobInfo@caption }{\JobInfo@name}}

        \vspace{0.25em}

        \ifdefvoid{\Profile@contactFirst}{}{{\Profile@contactFirst}\quad}
        \ifdefvoid{\Profile@contactSecond}{}{{\Profile@contactSecond}\quad}
        \ifdefvoid{\Profile@contactThird}{}{{\Profile@contactThird}\quad}
        \ifdefvoid{\Profile@link}{}{\href{https://\Profile@link}{\Profile@link}}
    \end{minipage}%
    \ifdefvoid{\Profile@photo}{}{%
        \begin{minipage}[c]{0.25\textwidth}
            \raggedleft
            \includegraphics[height=8em]{\FigInfo@path\Profile@photo}
        \end{minipage}%
    }
    \endgroup
}

% ━━━━━━━ 经历模块 ━━━━━━━
\SetupKeyvalOptions{
    family=module,
    prefix=Module@
}
\DeclareStringOption[Experience]{title}
\DeclareStringOption[yyyy/mm/dd]{dateFormat}
\setkeys{module}{}

% 经历环境设定
\titleformat{\section}[block]{\scalefont{\FontInfo@sectionScale}\sffamily}{}{0pt}{}[\titlerule]
\titlespacing{\section}{0pt}{\LayoutInfo@moduleSpacing}{1ex}%缩进距离、上间距、下间距
\newenvironment{module}[1][]{
    \setkeys{module}{#1}
    \section*{\Module@title}
}{}

% ━━━━━━━ 经历条目命令 ━━━━━━━
\SetupKeyvalOptions{
    family=exp,
    prefix=Exp@
}
\DeclareStringOption[]{title}
\DeclareStringOption[]{startTime}
\DeclareStringOption[]{endTime}
\DeclareStringOption[]{subtitle}
\DeclareStringOption[]{locale}
\DeclareStringOption[]{type}
\setkeys{exp}{}

\NewDocumentCommand{\MakeExp}{O{} m}{
    \begingroup
    \setkeys{exp}{#1}
    % 检查是否需要显示此经历条目
    \ifdefvoid{\Exp@type}{%
        % 如果经历条目没有指定type，则显示
        \MakeExpContent{#2}%
    }{%
        \ifdefvoid{\JobInfo@type}{%
            % 如果JobInfo没有指定type，则显示所有条目
            \MakeExpContent{#2}%
        }{%
            % 检查JobInfo的type和当前经历条目的type是否有交集
            \makeatletter\CheckIntersection{\Exp@type}{\JobInfo@type}\makeatother
            \ifnum\GetIntersection=1
                % 如果有交集，则显示经历条目
                \MakeExpContent{#2}%
            \fi
        }%
    }%
    \endgroup
}

% 将原先的内容部分拆分为单独的命令
\newcommand{\MakeExpContent}[1]{%
    \noindent
    \ifdefvoid{\Exp@title}{}{\begin{minipage}[t]{\textwidth}
        \ifdefvoid{\Exp@locale}{\parbox[t]{1\textwidth}{\sffamily{\Exp@title}}}{
        \parbox[t]{0.7\textwidth}{\sffamily{\Exp@title}} \hfill
        \parbox[t]{0.3\textwidth}{\raggedleft \Exp@locale}}%
    \end{minipage}}
    \ifdefvoid{\Exp@subtitle}{}{\begin{minipage}[t]{\textwidth}
        \ifdefvoid{\Exp@startTime}{\parbox[t]{1\textwidth}{\itshape \Exp@subtitle}}{
        \parbox[t]{0.7\textwidth}{\itshape \Exp@subtitle} \hfill
        \parbox[t]{0.3\textwidth}{\raggedleft \expandafter\DateFormat\expandafter{\Module@dateFormat}\expandafter\Date\expandafter{\Exp@startTime} -- \expandafter\DateFormat\expandafter{\Module@dateFormat}\expandafter\Date\expandafter{\Exp@endTime}}}%
    \end{minipage}}
    \begin{itemize}[leftmargin=*,nosep,topsep=0pt]
        #1
    \end{itemize}
    \vspace{\LayoutInfo@expSpacing}
}

% ━━━━━━━ 列表条目命令 ━━━━━━━
\SetupKeyvalOptions{
    family=item,
    prefix=Item@
}
\DeclareStringOption[Untitled]{title}
\setkeys{item}{}

\NewDocumentCommand{\MakeItem}{O{} m}{
    \begingroup
    \setkeys{item}{#1}
    \noindent
    \begin{minipage}[t]{\textwidth}
        \raggedright{\sffamily\Item@title: }{#2}
    \end{minipage}
    \endgroup
}

\makeatother
