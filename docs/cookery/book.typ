
#import "@preview/book:0.2.2": *
#import "./templates/page.typ": main-color

#show: book

#let main-color = main-color

// #let section-numbers = state("book-section", ())
#let section-numbers = ()

#let get-section(level) = {
  // section-numbers.update(it => {
  //   while it.len() < level {
  //     it.push(0)
  //   }
  //   if it.len() >= level {
  //     let last-level = it.at(level - 1)
  //     it = it.slice(0, level - 1) + (last-level, )
  //   }
  // })
  // locate(loc => {
  //   let l = section-numbers.query(loc)
  //   return l.map(str).join(".")
  // })
}

#book-meta(
  title: "reflexo-typst Documentation",
  summary: [
    #prefix-chapter("introduction.typ")[Introduction]
    = Guidance
    - #chapter("get-started.typ", section: "1")[Get started]
      - #chapter("guide/all-in-one.typ", section: "1.1")[All-in-one JavaScript Library]
    - #chapter("guide/compilers.typ", section: "2")[Compilers]
      - #chapter("guide/compiler/ts-cli.typ", section: "2.1")[Command Line Interface]
      - #chapter("guide/compiler/service.typ", section: "2.2")[Compiler Service Library]
      - #chapter("guide/compiler/serverless.typ", section: "2.3")[Serverless (In-browser) Compiler]
      - #chapter("guide/compiler/node.typ", section: "2.4")[Compiler for Node.js]
    - #chapter("guide/renderers.typ", section: "3")[Renderers]
      - #chapter("guide/renderer/ts-lib.typ", section: "3.1")[JavaScript/TypeScript Library]
      - #chapter("guide/renderer/react.typ", section: "3.2")[React Library]
      - #chapter("guide/renderer/angular.typ", section: "3.3")[Angular Library]
      - #chapter("guide/renderer/vue3.typ", section: "3.4")[Vue3 Library]
      - #chapter("guide/renderer/hexo.typ", section: "3.5")[Hexo Plugin]
    - #chapter("guide/trouble-shooting.typ", section: "4")[Trouble Shooting]
    = Advanced development
    - #chapter("guide/env-setup.typ", section: "5")[Environment Setup]
      - #chapter("guide/env-setup/renderer.typ", section: "5.1")[For Renderer]
      - #chapter("guide/env-setup/compiler.typ", section: "5.2")[For Compiler]
    - #chapter("dev/shims/core.typ", section: "6")[Wasm Shim - typst.ts]
      - #chapter(none, section: "6.1")[Lazy Loading Wasm Modules]
      - #chapter("dev/shims/renderer.typ", section: "6.2")[Low-level Renderer APIs]
      - #chapter("dev/shims/compiler.typ", section: "6.3")[Low-level Compiler APIs]
      - #chapter(none, section: "6.4")[Topic: Font Loading]
      - #chapter(none, section: "6.5")[Topic: Tree Shaking]
    - #chapter("dev/services/main.typ", section: "7")[Compiler service]
      - #chapter(none, section: "7.1")[Build a Precompiler]
      - #chapter("dev/services/editor-server.typ", section: "7.2")[Build a Editor Server]
      - #chapter("dev/services/cloud-compiler.typ", section: "7.3")[Build a Serverless Compiler]
      - #chapter(none, section: "7.4")[Topic: Preprocessing Dynamic Layout]
      - #chapter(none, section: "7.5")[Topic: Incremental Compilation]
    - #chapter(none, section: "8")[Write your Owned Exporter]
      - #chapter(none, section: "8.1")[Native Exporters]
      - #chapter(none, section: "8.2")[Vector Representation]
      - #chapter(none, section: "8.3")[Topic: SVG Exporter/Renderer]
    = Deeper dive into typst.ts
    - #chapter(none, section: "9")[Core Concepts]
      - #chapter(none, section: "9.1")[Exporter Trait]
      - #chapter(none, section: "9.2")[Compiler Trait]
    - #chapter(none, section: "10")[Vector Represented Document]
      - #chapter(none, section: "10.1")[Data Structure]
      - #chapter(none, section: "10.2")[Binary Protocol]
      - #chapter(none, section: "10.3")[Render Virtual Machine]
      - #chapter(none, section: "10.4")[Topic: Partially Accessible Document]
      - #chapter(none, section: "10.5")[Topic: BBox Calculation]
      - #chapter(none, section: "10.6")[Topic: Semantic Layer Rendering]
    - #chapter(none, section: "11")[Compiler Infrastructure]
      - #chapter(none, section: "11.1")[Split World Models]
      - #chapter(none, section: "11.2")[Virtual File System]
      - #chapter(none, section: "11.3")[Font Management]
      - #chapter(none, section: "11.4")[Typst Package Registry]
      - #chapter(none, section: "11.5")[Compile Driver]
      - #chapter(none, section: "11.6")[Editor Workspace]
    = Project samples
    - #chapter(none, section: "12")[typst-book]
    - #chapter(none, section: "13")[typst-preview]
    - #chapter(none, section: "14")[hexo-renderer-typst]
    = Trouble Shooting
    - #chapter(none, section: "15")[Targeting Browser]
      - #chapter(none, section: "15.1")[Build Wasm Modules]
      - #chapter(none, section: "15.2")[typst.ts]
      - #chapter(none, section: "15.3")[typst-ts-renderer]
      - #chapter(none, section: "15.4")[typst-ts-compiler]
    - #chapter(none, section: "16")[Installation]
      - #chapter(none, section: "16.1")[npm install/link]
    = References
    - #chapter(none, section: "17")[Routing to Renferences]
  ]
)

#get-book-meta()

// re-export page template
#import "/docs/cookery/templates/page.typ": project
#let book-page = project
