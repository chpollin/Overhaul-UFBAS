# GPT-supported Project Rehaul and Refactoring
Eine Fallstudie zur Überarbeitung und Erweiterung des Projekts ‘Urfehdebücher der Stadt Basel - digitale Edition’ (UFBAS) durch generative KI und LLM

## Analysing HTML with ChatGPT-4 Code Interpreter

* UFBAS - WebDev Analysis. August 2023. ChatGPT August 3 Version. https://chat.openai.com/share/a4d884a4-1cb5-4914-bdc1-e9a72b2f48b9.
* UFBAS - WebDev Analysis 2. August 2023. ChatGPT August 3 Version. https://chat.openai.com/share/01001b99-5e8e-491d-ab63-fc5c1fdafd7d 

### Findings

* chatGPT-4 does a good job of giving you an overview of multiple files (a whole web project). It analyses and describes each file.
* There are problems with XSLT analysis. 
* Too many files and too long files seem to be too complex.
* Limited to a maximum of 10 files.
* Can be used as a developer to get an overview of someone else's code.

### Initial Prompt

´´´
Here are two HTML pages of a web project from 2017. One is the home page, the other HTML is a web interface for reading a historical source with basic search functions. It is a digital edition of the original books of the city of Basel. I would like you to analyse the HTML step by step from the point of view of a web development under user interface expert. The aim is to improve and update the website. 
´´´

### HTML

#### Home Page (`home.htm`)

##### Document Structure
- Proper usage of HTML5 doctype declaration.
- Presence of viewport meta tag for responsiveness.
- Non-descriptive title (URL used as title).
- Lack of usage of semantic HTML tags.
- Potential issue with linked CSS file using a `resource://` URL.

##### Accessibility
- No images present, so no missing alt attributes.
- No form inputs present, so no missing labels.
- Lack of semantic HTML tags affecting content structure.

##### Responsiveness
- Presence of viewport meta tag, but full evaluation requires CSS inspection.

##### SEO Optimization
- Missing meta description and keywords tags.
- Non-descriptive title affecting SEO.
- Lack of heading structure (no `<h1>`, `<h2>`, etc.).

##### Code Quality
- Lack of semantic tags and other SEO-related issues affecting overall code quality.

#### Edition Page (`edition.htm`)

##### Document Structure
- Proper usage of HTML5 doctype declaration.
- Presence of viewport meta tag for responsiveness.
- Non-descriptive title (URL used as title).
- Lack of usage of semantic HTML tags.
- Potential issue with linked CSS file using a `resource://` URL.

##### Accessibility
- No images present, so no missing alt attributes.
- No form inputs present, so no missing labels.
- Lack of semantic HTML tags affecting content structure.

##### Responsiveness
- Presence of viewport meta tag, but full evaluation requires CSS inspection.

##### SEO Optimization
- Missing meta description and keywords tags.
- Non-descriptive title affecting SEO.
- Lack of heading structure (no `<h1>`, `<h2>`, etc.).

##### Code Quality
- Lack of semantic tags and other SEO-related issues affecting overall code quality.

### CSS (`template.css`, `navbar.css`)

#### navbar.css

##### Layout and Structure
- Background Color: Defined for the navigation bar, providing a consistent appearance.
- Hover and Focus States: Specific styling for interactive elements ensures a responsive user experience.

##### Colors and Typography
- Color Scheme: Utilizes various shades of gray and white, providing a neutral and professional appearance.
- Font Weight: Bold font weight for navigation links emphasizes the menu items.

##### Responsiveness
- Navbar Toggle: Includes styling for the toggle button, indicating consideration for mobile responsiveness.

#### template.css

##### Layout and Structure
- Typography: Defines styles for various text elements, including headings, links, and spans.
- Buttons: Includes styling for buttons, including background colors, padding, and hover states.
- Tables and Lists: Specific styling for tables and list items ensures consistent appearance.

##### Colors and Typography
- Project Color: A specific green color is defined as the project color, providing a unique branding element.
- Font Sizing and Weight: Varied font sizes and weights are used to differentiate text elements and create hierarchy.

##### Responsiveness
- Scrollable Menu: Defines a scrollable menu, enhancing usability on devices with limited display space.

### JavaScript

#### `datenkorb.js`

Overview of the code:
- The `datenkorb.js` file appears to be focused on handling data-related operations, specifically in the context of a "data basket" (Datenkorb).
- **Author Information**: The author's name, Christopher Pollin, is mentioned in the comments.
- **Function `getData(input)`**: This function seems to be the main logic for interacting with the data basket.
- **Working with Local Storage**: The code uses the browser's local storage to handle data, allowing for persistence across sessions.
- **Manipulating DOM Elements**: Elements are accessed and manipulated using their IDs and attributes.
- **Comments and Todos**: There are comments explaining the code's purpose, as well as "ToDos" indicating areas that might need further development or refinement.

##### Code Quality
- **Readability**: The code seems to be well-structured with comments explaining the logic.
- **Modularity**: The code might benefit from breaking down into smaller, more specific functions.
- **Use of `var`**: The code uses `var` for variable declarations, which is an older practice. Modern JavaScript encourages the use of `let` and `const`.

##### Functionality
- **Data Handling**: The code seems to handle adding and checking items in the data basket.
- **Error Handling**: Consider adding error handling for unexpected scenarios, such as issues with local storage.

##### User Interface Interaction
- **Console Logging**: The use of console logging indicates debugging or informational messages. Consider removing or reducing log statements in production code.

##### Possible Improvements
- **Refactor**: Break down larger functions into smaller, more manageable pieces.
- **Update Variable Declarations**: Consider updating `var` to `let` or `const`.
- **Add Error Handling**: Implement error handling to improve robustness.

### Conclusion

The code review of ‘Urfehdebücher der Stadt Basel - digitale Edition’ (UFBAS) project has revealed several areas for improvement, particularly in HTML and JavaScript. While the CSS shows solid work on layout and design, improvements can be made in HTML to enhance SEO, accessibility, and semantics. JavaScript can benefit from refactoring, error handling, and modern practices. Overall, the insights gained from this review provide a clear path for the project’s rehaul and refactoring, aligned with current best practices and considerations in web development.