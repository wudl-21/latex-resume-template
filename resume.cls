\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{resume}

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
    \PassOptionsToPackage{scheme=plain}{ctex}   % 阻止 ctex 宏包过度汉化
}
\ProcessOptions\relax

% 其余变量传递给 article 类
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax

\LoadClass[a4paper, 10pt]{article}   % 加载纸张尺寸=A4，字号=10，...，的 article 类
%%━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━


% ┏━━━━━━━━━━━━━━━━━━━━━┓
% ┃       调用宏包      ┃
% ┗━━━━━━━━━━━━━━━━━━━━━┛
\RequirePackage[UTF8]{ctex} % 中文支持
\RequirePackage{fix-cm}     % 允许修改字体大小
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

% ━━━━━━━ 页面布局 ━━━━━━━
\geometry{
    top=0.5in,
    bottom=0.67in,
    left=0.5in,
    right=0.5in,
    headheight=0pt,
    footskip=0pt
}
\pagestyle{empty}                    % 隐藏页眉页脚


% ┏━━━━━━━━━━━━━━━━━━━━━┓
% ┃         字体        ┃
% ┗━━━━━━━━━━━━━━━━━━━━━┛
%% 常规
\setmonofont{SFMonoSC}      % 设定等宽字体
\setsansfont{HelveticaNeue}  % 设定无衬线字体
\setCJKsansfont{FZHei}[ % 中文无衬线字体
    AutoFakeSlant = 0.15    % 伪斜体修正（可选）
]
\setCJKmonofont{SFMonoSC}[ % 中文等宽字体
    AutoFakeSlant = 0.15    % 伪斜体修正（可选）
]
%━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━


% ┏━━━━━━━━━━━━━━━━━━━━━┓
% ┃      自定义命令     ┃
% ┗━━━━━━━━━━━━━━━━━━━━━┛
% ━━━━━━━ 日期格式转换 ━━━━━━━
\input{command/date}


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


% ━━━━━━━ 个人信息 ━━━━━━━
\SetupKeyvalOptions{
    family=profile,
    prefix=Profile@
}
\DeclareStringOption[]{name}
\DeclareStringOption[]{email}
\DeclareStringOption[]{link}
\DeclareStringOption[]{phone}
\DeclareStringOption[]{photo}
\setkeys{profile}{}

\NewDocumentCommand{\MakeProfile}{O{}}{
    \begingroup
    \setkeys{profile}{#1}
    \noindent
    \begin{minipage}[c]{\ifdefvoid{\Profile@photo}{1\textwidth}{0.75\textwidth}}
        {\Huge\sffamily\Profile@name}
        
        \vspace{0.5em}
        
        \ifdefvoid{\Profile@email}{}{{\Profile@email}\quad}
        \ifdefvoid{\Profile@phone}{}{{\Profile@phone}\quad}
        \ifdefvoid{\Profile@link}{}{\href{https://\Profile@link}{\Profile@link}}
    \end{minipage}%
    \ifdefvoid{\Profile@photo}{}{%
        \begin{minipage}[c]{0.25\textwidth}
            \raggedleft
            \includegraphics[height=3cm]{\FigInfo@path\Profile@photo}
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
\titleformat{\section}[block]{\Large\sffamily}{}{0pt}{}[\titlerule]
\titlespacing{\section}{0pt}{2pt}{6pt}%缩进距离、上间距、下间距
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
\setkeys{exp}{}

\NewDocumentCommand{\MakeExp}{O{} m}{
    \begingroup
    \setkeys{exp}{#1}
    \noindent
    \ifdefvoid{\Exp@title}{}{\begin{minipage}[t]{\textwidth}
        \ifdefvoid{\Exp@startTime}{\parbox[t]{1\textwidth}{\sffamily{\Exp@title}}}{
        \parbox[t]{0.7\textwidth}{\sffamily{\Exp@title}} \hfill
        \parbox[t]{0.3\textwidth}{\raggedleft \expandafter\DateFormat\expandafter{\Module@dateFormat}\expandafter\Date\expandafter{\Exp@startTime} -- \expandafter\DateFormat\expandafter{\Module@dateFormat}\expandafter\Date\expandafter{\Exp@endTime}}}%
    \end{minipage}}
    \ifdefvoid{\Exp@subtitle}{}{
        \begin{minipage}[t]{\textwidth}
            \parbox[t]{0.7\textwidth}{\itshape \Exp@subtitle} \hfill
            \parbox[t]{0.3\textwidth}{\raggedleft \Exp@locale}
        \end{minipage}
    }
    \begin{itemize}[leftmargin=*,nosep,topsep=0pt]
        #2
    \end{itemize}
    \vspace{4pt}
    \endgroup
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
