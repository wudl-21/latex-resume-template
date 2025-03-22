**Read this in other languages: [English](README_en.md) | [中文](README_zh.md)**

# LaTeX 简历模板

## 描述

该项目提供了一个用于创建专业简历的 LaTeX 模板。

## 特点

- 多语言支持（英文和中文）
- 可定制的布局和样式
- 易于添加和修改部分
- 支持自定义字体和图片

## 使用方法

1. **安装 LaTeX**: 确保您的系统上已安装 LaTeX 发行版（例如 TeX Live、MiKTeX）。
2. **克隆仓库**: 将此仓库克隆到本地。

   ```sh
   git clone <repository-url>
   ```

3. **编译 LaTeX 文档**: 导航到项目目录，使用 LaTeX 编辑器或命令行编译 `main.tex` 文件。

    ```sh
    cd latex-resume-template
    xelatex main.tex
    ```

4. **查看输出**: 编译后的 PDF 文件（`main.pdf`）将生成在项目目录下。

## 自定义命令

以下是模板提供的自定义命令、参数、含义和使用方法：

- 前置命令

    | 命令 | 可选参数 | 含义 | 使用方法 |
    | --- | --- | --- | --- |
    | `\LayoutInfo` | `lineSpacing`, `tableLineSpacing`, `indent`, `paragraphSpacing` | 设置布局信息，如行间距、表格行间距、缩进和段间距 | `\LayoutInfo[lineSpacing=1.1, tableLineSpacing=1.0, indent=0em, paragraphSpacing=0em]` |
    | `\FigInfo` | `path` | 设置图片路径 | `\FigInfo[path=./img/]` |

- 文档内命令

    | 命令 | 可选参数 | 含义 | 使用方法 |
    | --- | --- | --- | --- |
    | `\MakeProfile` | `name`, `email`, `link`, `phone`, `photo` | 设置个人信息，包括姓名、邮箱、链接、电话和照片 | `\MakeProfile[name=张三, email=zhangsan@email.com, link=https://example.com, phone=+1 (123) 456-7890, photo=portrait_placeholder_w4h5.png]` |
    | `\MakeExp` | `title`, `startTime`, `endTime`, `subtitle`, `locale` | 设置经历条目，包括标题、开始时间、结束时间、副标题和地点 | `\MakeExp[title=软件工程师, startTime=2020-01-01, endTime=2022-01-01, subtitle=某公司, locale=某城市]{\item 负责开发和维护公司内部软件系统}` |
    | `\MakeItem` | `title` | 设置列表条目，包括标题 | `\MakeItem[title=编程语言]{Python, C++, Java}` |

- 文档内环境

    | 名称 | 可选参数 | 含义 | 使用方法 |
    | --- | --- | --- | --- |
    | `module` | `title`, `dateFormat` | 定义一个模块，包括标题和日期格式 | `\begin{module}[title=工作经历, dateFormat=yyyy年m月] ... \end{module}` |

### 日期格式设定

模板的`module`环境中，`dateFormat`参数支持关键字匹配的自定义日期格式

| 关键字 | 含义 | 示例 |
| --- | --- | --- |
| `yyyy` | 四位数年份 | 2025 |
| `yy` | 两位数年份 | 25 |
| `mmmm` | 完整月份名称 | January |
| `mmm` | 缩写月份名称 | Jan |
| `mm` | 两位数月份 | 01 |
| `m` | 一位数月份 | 1 |
| `dd` | 两位数日期 | 01 |
| `d` | 一位数日期 | 1 |
| `t` | 日期的序数后缀上标 | $^{st}$, $^{nd}$, $^{rd}$, $^{th}$ |

以下是一些日期格式化的例子，实际使用可自由组合关键字：

| `dateFormat=` | 日期 | 输出 |
| --- | --- | --- |
| `dd/mm/yyyy` | `2023-01-05` | 05/01/2023 |
| `yyyy年m月d日` | `2023-01-05` | 2023年1月5日 |
| `yy-m-d` | `2023-01-05` | 23-1-5 |
| `d mmm.t yy` | `2023-01-05` | 5 Jan.$^\text{th}$ 23 |
| `yyyyy年mmmddt` | `2023-01-02` | 2023y年Jan02$^\text{nd}$ |

在 `module` 环境中使用自定义日期格式：

```tex
\begin{module}[%
    title=工作经历,
    dateFormat=yyyy年m月 % 这里可以自定义格式，环境内部命令参数中的日期都会以此格式输出
    ]%

    %% 例如，当你创建一个经历段时...
    \MakeExp[%
        title=某公司,
        startTime=2020-01-01, % 这里输入标准的日期，年月日都需要给定，使用“-”分隔
        endTime=2022-01-01, % 同上
        subtitle=软件工程师,
        locale=某城市
    ]%
    {
        \item ...
    }

\end{module}
```

### 示例用法

- 基本结构

    ```tex
    \begin{module}[% 开始一个模块
        title=工作经历,
        dateFormat=yyyy年m月
        ]%

        %% 创建一个经历段
        \MakeExp[%
            title=某公司,
            startTime=2020-01-01,
            endTime=2022-01-01,
            subtitle=软件工程师,
            locale=某城市
        ]%
        {
            \item 负责开发和维护公司内部软件系统
            \item 参与需求分析和系统设计
            \item 编写高质量的代码并进行单元测试
        }

        %% 此外，也可以创建一个单独要点
        \MakeItem[title=编程语言]{Python, C++, Java}

    \end{module} % 结束模块
    ```
