# ChatGPTSwift

IOS Chatbot application that utilizes ChatGPT and the OpenAI APIs.

This is an example of how to integrate my OpenAI Swift package in your project. 
Take a look at my OpenAI repository for a more detailed explination on API types
and integration.


## Usage

1. Open ChatGPTSwift in Xcode

2. Use Swift Package Manager to integrate the OpenAI library by adding the following dependency in your Package.swift file:

   .Package(url: "https://github.com/TyWysocki/OpenAISwift.git", majorVersion: 1)

3. Generate a authorization token [here](https://beta.openai.com/account/api-keys) & Copy/Paste your token
   inside the setup function on line 16 in the ContentView:
   
   >     client = OpenAI(authToken: "TOKEN")
   
4. Run the program and ask ChatGPT to preform a task, answer a question, etc.


## License

The MIT License (MIT)

Copyright (c) 2022 Tyler Wysocki

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
