**以其他语言阅读: [English](README.md) | [中文](README_zh.md)**

# LaTeX Resume Template

## Description

This project provides a LaTeX template for creating professional resumes.

## Features

- Multilingual support (English and Chinese)
- Customizable layout and style
- Easy to add and modify sections
- Supports custom fonts and images

## Usage

1. **Install LaTeX**: Ensure that a LaTeX distribution (e.g., TeX Live, MiKTeX) is installed on your system.
2. **Clone the repository**: Clone this repository to your local machine.

   ```sh
   git clone <repository-url>
   ```

3. **Compile the LaTeX document**: Navigate to the project directory and compile the `main.tex` file using your LaTeX editor or command line.

    ```sh
    cd latex-resume-template
    xelatex main.tex
    ```

4. **View the output**: The compiled PDF file (`main.pdf`) will be generated in the project directory.

## Custom Commands

Below are the custom commands provided by the template, along with their parameters, meanings, and usage:

- Predefined Commands

    | Command | Optional Parameters | Meaning | Usage |
    | --- | --- | --- | --- |
    | `\LayoutInfo` | `lineSpacing`, `tableLineSpacing`, `indent`, `paragraphSpacing` | Set layout information such as line spacing, table line spacing, indentation, and paragraph spacing | `\LayoutInfo[lineSpacing=1.1, tableLineSpacing=1.0, indent=0em, paragraphSpacing=0em]` |
    | `\FigInfo` | `path` | Set image path | `\FigInfo[path=./img/]` |

- In-Document Commands

    | Command | Optional Parameters | Meaning | Usage |
    | --- | --- | --- | --- |
    | `\MakeProfile` | `name`, `email`, `link`, `phone`, `photo` | Set personal information including name, email, link, phone, and photo | `\MakeProfile[name=John Doe, email=johndoe@email.com, link=https://example.com, phone=+1 (123) 456-7890, photo=portrait_placeholder_w4h5.png]` |
    | `\MakeExp` | `title`, `startTime`, `endTime`, `subtitle`, `locale` | Set experience entry including title, start time, end time, subtitle, and location | `\MakeExp[title=Software Engineer, startTime=2020-01-01, endTime=2022-01-01, subtitle=Some Company, locale=Some City]{\item Responsible for developing and maintaining internal software systems}` |
    | `\MakeItem` | `title` | Set list item including title | `\MakeItem[title=Programming Languages]{Python, C++, Java}` |

- In-Document Environments

    | Name | Optional Parameters | Meaning | Usage |
    | --- | --- | --- | --- |
    | `module` | `title`, `dateFormat` | Define a module including title and date format | `\begin{module}[title=Work Experience, dateFormat=yyyy-mm] ... \end{module}` |

### Date Format Settings

In the `module` environment, the `dateFormat` parameter supports custom date formats with keyword matching.

| Keyword | Meaning | Example |
| --- | --- | --- |
| `yyyy` | Four-digit year | 2025 |
| `yy` | Two-digit year | 25 |
| `mmmm` | Full month name | January |
| `mmm` | Abbreviated month name | Jan |
| `mm` | Two-digit month | 01 |
| `m` | Single-digit month | 1 |
| `dd` | Two-digit day | 01 |
| `d` | Single-digit day | 1 |
| `t` | Ordinal suffix | $^{st}$, $^{nd}$, $^{rd}$, $^{th}$ |

Here are some examples of date formatting, you can freely combine any keywords in actual use:

| `dateFormat=` | Date | Output |
| --- | --- | --- |
| `dd/mm/yyyy` | `2023-01-05` | 05/01/2023 |
| `yyyy年m月d日` | `2023-01-05` | 2023年1月5日 |
| `yy-m-d` | `2023-01-05` | 23-1-5 |
| `d mmm.t yy` | `2023-01-05` | 5 Jan.$^\text{th}$ 23 |
| `yyyyy年mmmddt` | `2023-01-02` | 2023y年Jan02$^\text{nd}$ |

Using custom date formats in the `module` environment:

```tex
\begin{module}[% 
    title=Work Experience,
    dateFormat=yyyy-mm % Custom format here, dates in the environment commands will be output in this format
    ]%

    %% For example, when creating an experience entry...
    \MakeExp[%
        title=Some Company,
        startTime=2020-01-01, % Enter standard date here, year-month-day separated by "-"
        endTime=2022-01-01, % Same as above
        subtitle=Software Engineer,
        locale=Some City
    ]%
    {
        \item ...
    }

\end{module}
```

### Example Usage

- Basic Structure

    ```tex
    \begin{module}[% Start a module
        title=Work Experience,
        dateFormat=yyyy-mm
        ]%

        %% Create an experience entry
        \MakeExp[%
            title=Some Company,
            startTime=2020-01-01,
            endTime=2022-01-01,
            subtitle=Software Engineer,
            locale=Some City
        ]%
        {
            \item Responsible for developing and maintaining internal software systems
            \item Participated in requirement analysis and system design
            \item Wrote high-quality code and performed unit testing
        }

        %% Additionally, you can create a separate item
        \MakeItem[title=Programming Languages]{Python, C++, Java}

    \end{module} % End module
    ```
