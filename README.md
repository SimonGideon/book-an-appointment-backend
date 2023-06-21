<div align="center">
  
  ![image](https://github.com/jmonto55/book-an-appointment-backend/assets/61404403/dd4d0fee-129d-4a04-b4c7-dff5bb004b32)

  <h1><b>House Reservations</b></h1>
  <!-- <img src="https://github.com/jmonto55/book-an-appointment-backend/assets/61404403/dd4d0fee-129d-4a04-b4c7-dff5bb004b32" alt="blog img" width="45%" />
  <img src="./app/assets/images/blog_2.png" alt="blog img" width="45%" /> -->
</div>

# 📗 Table of Contents

- [📖 About the Project](#about-project)
  - [🛠 Built With](#built-with)
    - [Tech Stack](#tech-stack)
    - [Key Features](#key-features)
  - [🚀 Live Demo](#live-demo)
- [💻 Getting Started](#getting-started)
  - [Setup](#setup)
  - [Kanbanboards](#kanbanboards)
  - [Prerequisites](#prerequisites)
  - [Install](#install)
  - [Usage](#usage)
  - [Run tests](#run-tests)
  - [Deployment](#triangular_flag_on_post-deployment)
- [👥 Authors](#authors)
- [🔭 Future Features](#future-features)
- [🤝 Contributing](#contributing)
- [⭐️ Show your support](#support)
- [🙏 Acknowledgements](#acknowledgements)
- [❓ FAQ](#faq)
- [📝 License](#license)

# 📖 House Reservations <a name="about-project"></a>

> This is a House reservation API that allows authorized users to create and delete reservations on desired houses. It also provides a list of all houses available to be reserved.

## 🛠 Built With <a name="built-with"></a>

### Tech Stack <a name="tech-stack"></a>
<details>
  <summary>Server</summary>
  <ul>
    <li><a href="https://rubyonrails.org/">Ruby on Rails</a></li>
  </ul>
  </details>
  <details>
  <summary>Database</summary>
  <ul>
    <li><a href="https://www.postgresql.org/">PostgreSQL</a></li>
  </ul>
</details>

### Key Features <a name="key-features"></a>

- [X] **Data Model**
- [X] **Add and delete houses**
- [X] **Make your reservation**
- [X] **Delete unwanted reservation**  

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- LIVE DEMO -->

## 🚀 Live Demo <a name="live-demo"></a>

- [Frontend view](https://book-an-appointment-frontend.vercel.app)
- [Backend Link](https://rails-8q41.onrender.com)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 💻 Getting Started <a name="getting-started"></a>

To get a local copy up and running follow these simple example steps.

### Prerequisites

> You need the following tools be installed in your computer:

> - [Rails](https://guides.rubyonrails.org/)
> - [Git](https://www.linode.com/docs/guides/how-to-install-git-on-linux-mac-and-windows/)
> - [Ruby](https://github.com/microverseinc/curriculum-ruby/blob/main/simple-ruby/articles/ruby_installation_instructions.md)

### Kanbanboards
1. [Initial Kanbanboard](https://github.com/jmonto55/book-an-appointment-backend/issues/1)
2. [Final Kanbanboard](https://github.com/jmonto55/book-an-appointment-backend/projects/2)

### Setup

Clone this repository to your desired folder:

```bash
cd my-prefered-folder
git clone https://github.com/jmonto55/book-an-appointment-backend.git
```

### Install

Install this project with:

> Navigate into the project directory
```sh
cd book-an-appointment-backend
```
> Install the related dependencies
```sh
bundle install
```
### 💾 Database

>Create the databases
```sh
rails db:create
```
>run migrations
```sh
rails db:migrate
```
> Populate it with seed data:
```sh
rails db:seed
```
### Usage

To run the project run the following commands:

```sh
rails s
```
> Run the server then
[Read API Documentation](http://localhost:3000/api-docs/index.html)

### Run tests
To run tests, run the following command:
```ruby
rspec spec --exclude-pattern "spec/integration/*_spec.rb"
```
<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 👥 Authors <a name="author"></a>

👤 **Mohamed Abd Elmohsen Saleh**

-   GitHub: [@mohamed20163858](https://github.com/mohamed20163858)
-   Twitter: [@mohamed20163858](https://twitter.com/mohamed20163858)
-   LinkedIn: [mohamed20163858](https://linkedin.com/in/mohamed20163858/)

👤 **Bryan Hurtado**
-   GitHub: [@DarkxDev](https://github.com/DarkxDev)
-   LinkedIn: [bryan-hurtado](https://www.linkedin.com/in/bryan-hurtado/)

👤 **Simon Gideon**
-   GitHub: [@SimonGideon](https://github.com/SimonGideon)
-   Twitter: [@Simon_Gideon](https://twitter.com/Simon_Gideon)
-   LinkedIn: [simon-gideon](https://www.linkedin.com/in/simon-gideon/)

👤 **Jose Montoya**
- GitHub: [@jmonto55](https://github.com/jmonto55)
- LinkedIn: [jmontodev](https://www.linkedin.com/in/jmontodev/)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 🔭 Future Features <a name="future-features"></a>

- [x] **Image upload instead of a link**
- [x] **Signup and Email verification for users**
- [x] **Admin panel to manage houses and reservations**

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 🤝 Contributing <a name="contributing"></a>

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](https://github.com/jmonto55/blog-app/issues).

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## ⭐️ Show your support <a name="support"></a>

If you like this project please give it a star 😁🌟✨

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 🙏 Acknowledgments <a name="acknowledgements"></a>

Thanks to [Murat Korkmaz](https://www.behance.net/muratk) for the aswesome [design](https://www.behance.net/gallery/26425031/Vespa-Responsive-Redesign).

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 📝 License <a name="license"></a>

This project is [MIT](./LICENSE) licensed.

<p align="right">(<a href="#readme-top">back to top</a>)</p>
