---
layout: post
title: Returning to simple 
author: Carlos Kelkboom
date: 2023-09-21
published: false
tags: Agile
---

## Making things simple

> I currently work as a technical director for a wonderful company called Artificial Core. We are creating an MMO RPG called Corepunk and this story is about: "How I try to return to simple."

In today's high-paced software development world, Agile practices are the norm. But is every agile method suitable for every project? As we journeyed through the development of Corepunk, a massive multiplayer online role-playing game (MMO RPG), I often found myself asking this very question. Today, I'm sharing how I've endeavored to simplify the complex.

Every project balances on an internal loop:

* Getting the correct information from production
* Prioritizing that information
* Starting a task
* Finishing that task correctly and efficiently
* Deploying your results
* Managing feedback on the product



## The Crux of Complexity
Developing an MMO RPG is, by nature, a monumental task. And when you add the intricacies of Agile (capital A) practices like Scrum, which I've personally found concerning, the whole process can become mired in inefficiencies. That's why I chose an alternative path.

Agile, My Way
Drawing from multiple agile software development practices, I tailored a methodology designed to cut through the chaos. Here's a look at the core principles:

* **Extreme Programming (XP)**: We adopted some of the most effective practices from XP to ensure software quality and responsiveness to changing customer requirements.
* **Kanban with a Twist**: Our Kanban board has a simple left-to-right flow, emphasizing the progression and reducing the potential for tasks to ping-pong between columns. I need to know when something is done, not when someone *thinks* it is done!
* **Backlog Prioritization**: With a sunset on backlog items, we ensure that irrelevant or outdated tasks don't crowd our priorities.
* **Clear Task Definitions**: We enforce clarity by allowing devs to pick from a 'Refined' column themselves, ensuring each task is well-articulated and everyone commits to doing the task.
* **Emphasizing Communication**: Omitting a traditional QA column compels devs and QA professionals to engage in continuous dialogue, refining the end product.

## Version Control Simplified
Our Git structure is designed for clarity:

We keep everything in feature/name-of-feature branches.
Before any merge to the master, we first merge the master into the feature branch.
Release-specific fixes are diligently applied both to release branches and the master.
Documentation: Tiered and Transparent
We've segregated documentation to offer clarity at every level:

High Level: Confluence houses our process and project documentation.
Technical Details: Markdown files, committed alongside code, delve into the technicalities.
Task-specific: JIRA gives us the lowdown on individual tasks.
Collaboration at Its Core
At the heart of our approach is collaboration. Production teams work hand-in-hand with devs and QAs, fostering open conversations that enhance the product. And though we may not strictly adhere to Test-Driven Development (TDD), our robust integration tests ensure the product's reliability.

Remote Yet Unified
Though our team operates entirely remotely, the structures in place — from our communication mandates to our clear documentation — ensure seamless collaboration, rendering geographical distances irrelevant.

Closing Thoughts
In the quest to develop Corepunk, the idea was never to reinvent the wheel but to strip away the unnecessary, to return to simplicity. By tailoring Agile practices to our unique needs, we've found a rhythm that works for us — one that might just resonate with you.