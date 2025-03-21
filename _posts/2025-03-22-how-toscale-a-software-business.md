---
layout: post
title: How to scale a Software business 
author: Carlos Kelkboom
date: 2025-03-22
published: true
tags: Software Development
---

# How to scale a Software business

---

## Table of Contents

- [1. Introduction](#1-introduction)
- [2. The Inevitable Dance: Complexity vs. Maintainability in Software Development](#2-the-inevitable-dance-complexity-vs-maintainability-in-software-development)
  - [2.1 The Growth Spiral](#21-the-growth-spiral)
  - [2.2 Understanding the Complexity Curve](#22-understanding-the-complexity-curve)
  - [2.3 Measuring the Balance](#23-measuring-the-balance)
  - [2.4 The Myth of Avoiding the Rewrite](#24-the-myth-of-avoiding-the-rewrite)
  - [2.5 Embracing the Inevitable Dance](#25-embracing-the-inevitable-dance)
  - [2.6 Conclusion](#26-conclusion)
- [3. Recognizing and Managing Maintainability Breaks](#3-recognizing-and-managing-maintainability-breaks)
  - [3.1 The Four Horsemen of a Maintainability Crisis](#31-the-four-horsemen-of-a-maintainability-crisis)
    - [3.1.1 Declining Productivity](#311-declining-productivity)
    - [3.1.2 Extending Onboarding Time](#312-extending-onboarding-time)
    - [3.1.3 Quality Deterioration](#313-quality-deterioration)
    - [3.1.4 Developer Resistance](#314-developer-resistance)
  - [3.2 Accepting the Inevitable Scale Limitations](#32-accepting-the-inevitable-scale-limitations)
  - [3.3 The Premature Optimization Trap](#33-the-premature-optimization-trap)
  - [3.4 Architectural Segmentation: The Key to Graceful Evolution](#34-architectural-segmentation-the-key-to-graceful-evolution)
  - [3.5 Planning for Transitions: The Strangulation Pattern](#35-planning-for-transitions-the-strangulation-pattern)
  - [3.6 Cultural Acceptance of Architectural Evolution](#36-cultural-acceptance-of-architectural-evolution)
  - [3.7 Measuring and Monitoring Maintainability](#37-measuring-and-monitoring-maintainability)
  - [3.8 Conclusion: Embracing the Rhythm of Renewal](#38-conclusion-embracing-the-rhythm-of-renewal)
- [4. Team Structure and Planning: Managing the Complexity Dance](#4-team-structure-and-planning-managing-the-complexity-dance)
  - [4.1 Development Team: The Custodians of Complexity](#41-development-team-the-custodians-of-complexity)
  - [4.2 Planning and Evaluation: Balancing Value and Sustainability](#42-planning-and-evaluation-balancing-value-and-sustainability)
  - [4.3 Monetizing the Invisible: Valuing Technical Work](#43-monetizing-the-invisible-valuing-technical-work)
    - [4.3.1 Valuation Framework: Making the Invisible Visible](#431-valuation-framework-making-the-invisible-visible)
    - [4.3.2 Valuing Features](#432-valuing-features)
    - [4.3.3 Valuing Technical Debt](#433-valuing-technical-debt)
    - [4.3.4 Valuing Customer Service Items](#434-valuing-customer-service-items)
    - [4.3.5 Example: Valuing a Maintainability Break](#435-example-valuing-a-maintainability-break)
    - [4.3.6 Maintenance Budget: Ensuring Sustainable Balance](#436-maintenance-budget-ensuring-sustainable-balance)
  - [4.4 Connecting Team Structure to Architectural Evolution](#44-connecting-team-structure-to-architectural-evolution)
  - [4.5 Measuring Success: Beyond Feature Delivery](#45-measuring-success-beyond-feature-delivery)
  - [4.6 Conclusion: People as Complexity Managers](#46-conclusion-people-as-complexity-managers)
- [5. Organizational Scaling: Maintaining Agility While Growing](#5-organizational-scaling-maintaining-agility-while-growing)
  - [5.1 The Flat Structure Advantage](#51-the-flat-structure-advantage)
  - [5.2 The 10-Team Unit: A Natural Scaling Threshold](#52-the-10-team-unit-a-natural-scaling-threshold)
  - [5.3 Domain-Driven Organization: Aligning Teams with Architecture](#53-domain-driven-organization-aligning-teams-with-architecture)
    - [5.3.1 One Domain, One Team](#531-one-domain-one-team)
    - [5.3.2 Multi-Domain Teams](#532-multi-domain-teams)
  - [5.4 Governance Through Interfaces, Not Oversight](#54-governance-through-interfaces-not-oversight)
  - [5.5 Evolution of Roles as Organizations Scale](#55-evolution-of-roles-as-organizations-scale)
  - [5.6 Handling Cross-Domain Features](#56-handling-cross-domain-features)
  - [5.7 Scaling Case Study: From 5 to 80 Developers](#57-scaling-case-study-from-5-to-80-developers)
  - [5.8 Conway’s Law and Architectural Evolution](#58-conways-law-and-architectural-evolution)
  - [5.9 Managing Organizational Rewrites](#59-managing-organizational-rewrites)
  - [5.10 Conclusion: Organizations as Complex Adaptive Systems](#510-conclusion-organizations-as-complex-adaptive-systems)
- [6. Metrics and Governance: Measuring What Matters in Software Organizations](#6-metrics-and-governance-measuring-what-matters-in-software-organizations)
  - [6.1 The Metrics Hierarchy: From Code to Strategy](#61-the-metrics-hierarchy-from-code-to-strategy)
  - [6.2 Code-level Metrics: The Foundation](#62-code-level-metrics-the-foundation)
    - [6.2.1 Essential Code Metrics](#621-essential-code-metrics)
    - [6.2.2 Setting Up Code Metrics](#622-setting-up-code-metrics)
  - [6.3 Team-level Metrics: Delivery Effectiveness](#63-team-level-metrics-delivery-effectiveness)
    - [6.3.1 Essential Team Metrics](#631-essential-team-metrics)
    - [6.3.2 Setting Up Team Metrics](#632-setting-up-team-metrics)
  - [6.4 Product-level Metrics: User Impact](#64-product-level-metrics-user-impact)
    - [6.4.1 Essential Product Metrics](#641-essential-product-metrics)
    - [6.4.2 Setting Up Product Metrics](#642-setting-up-product-metrics)
  - [6.5 Strategic Metrics: Organizational Capability](#65-strategic-metrics-organizational-capability)
    - [6.5.1 Essential Strategic Metrics](#651-essential-strategic-metrics)
    - [6.5.2 Setting Up Strategic Metrics](#652-setting-up-strategic-metrics)
  - [6.6 Governance: Taking Action on Metrics](#66-governance-taking-action-on-metrics)
    - [6.6.1 The Governance Framework](#661-the-governance-framework)
      - [Team-level Governance](#team-level-governance)
      - [Domain-level Governance](#domain-level-governance)
      - [Strategic Governance](#strategic-governance)
  - [6.7 Trigger-Based Governance: When to Act](#67-trigger-based-governance-when-to-act)
  - [6.8 Common Metrics Pitfalls](#68-common-metrics-pitfalls)
  - [6.9 Metrics Evolution: Growth-Stage Appropriate Measurement](#69-metrics-evolution-growth-stage-appropriate-measurement)
  - [6.10 Case Study: Metrics Driving Architectural Evolution](#610-case-study-metrics-driving-architectural-evolution)
  - [6.11 Conclusion: Metrics as a Strategic Asset](#611-conclusion-metrics-as-a-strategic-asset)

---

## 1. Introduction

Scaling a software company is a multifaceted journey that begins with a spark of innovation and unfolds through a delicate dance between complexity and maintainability. This document provides a comprehensive framework for navigating this journey, addressing the strategic, technical, organizational, and operational challenges that arise as a company grows from two founders delivering their first feature to an enterprise orchestrating dozens of teams.

At its core, scaling begins when a small team creates a Minimal Viable Product (MVP) that delivers just enough value to attract that crucial first customer. From there, the spiral begins: each new feature attracts additional customers, generating revenue that enables hiring, which in turn accelerates feature development. But with this natural growth comes an inevitable increase in complexity.

The central thesis of this document is that complexity is not a flaw to be eliminated but a reality to be managed. Any successful software product will eventually reach complexity thresholds that necessitate architectural evolution. These aren’t failures—they’re milestones that mark your success. The key is recognizing the warning signs early and responding with intentional, well-timed transitions rather than crisis-driven rewrites.

Throughout these pages, we explore this principle through five interconnected dimensions of scaling:

- **The Complexity-Maintainability Balance**
- **Valuation and Planning**
- **Team Structure and Scaling**
- **Organizational Evolution**
- **Metrics and Governance**

As you read, consider where your organization stands and whether you’re recognizing the early signs of maintainability challenges.

---

## 2. The Inevitable Dance: Complexity vs. Maintainability in Software Development

Every software company begins with a spark—an idea that promises to automate a process or bring clarity to information. Two founders, fueled by vision and determination, create an MVP that delivers just enough value to attract their first customer. This moment marks the beginning of a complex dance that will define the company’s journey for years to come.

### 2.1 The Growth Spiral

Picture this: You’ve landed your first customer. They’re using your software, providing feedback, and, most importantly, paying you. The validation is intoxicating. But one customer doesn’t make a company, so you begin searching for the second.

During a promising demo, a potential customer says, “This is great, but could it also do X?” You exchange a knowing look with your co-founder and reply, “Of course it can,” already mentally scheduling the late nights needed to build this new feature before the contract is signed.

And so begins the cycle:
- A new feature leads to a new customer.
- New revenue enables a new hire.
- Additional development capacity creates more features.
- More features attract more customers.

By your tenth customer, you’re no longer giving demos personally. You’ve hired a sales representative, and your technical co-founder is now managing three developers. Customer support and even marketing begin to take shape.

### 2.2 Understanding the Complexity Curve

Each line of code, each database choice, each API integration adds to the complexity of your system. This complexity is a natural consequence of growth and adaptation. Like an untended garden, unchecked complexity will eventually choke productivity if not managed.

Consider Atwood’s Law: “Any application that can be written in JavaScript, will eventually be written in JavaScript.” Similarly, any successful software product will eventually hit a complexity threshold that necessitates a rewrite—not as a failure, but as a milestone of success.

### 2.3 Measuring the Balance

How do you know if you’re maintaining the right balance? Track three key indicators:
1. **Feature Velocity:** How quickly can you implement new capabilities?
2. **Support Triage Items:** What signals are your customers sending regarding reliability and usability?
3. **Maintainability Breaks:** Where is your system showing signs of strain?

These metrics will help you recognize when it’s time to evolve your architecture.

### 2.4 The Myth of Avoiding the Rewrite

Many companies implement rigid processes like SCRUM or SAFe when problems arise, hoping these frameworks will resolve issues magically. However, processes alone can’t fix underlying architectural limitations. The rewrite is not a failure—it is a rebirth. When your system outgrows its original design, a rewrite becomes a milestone of growth.

### 2.5 Embracing the Inevitable Dance

To manage this reality:
- Accept that complexity and maintainability exist in constant tension.
- Time your rewrite when your company has the resources and capability to handle it.
- Measure relentlessly to detect when balance shifts too far.
- Communicate openly with your team about these transitions.

### 2.6 Conclusion

The dance between complexity and maintainability defines your software journey. Each new feature, customer, or hire alters the rhythm. Successful companies don’t avoid complexity—they learn to manage and embrace it. Recognize maintainability challenges as signs of growth, not failures.

---

## 3. Recognizing and Managing Maintainability Breaks

Every software journey involves moments when developers silently acknowledge that something fundamental has shifted—these are the maintainability breaks, critical junctures when your system begins to show strain.

### 3.1 The Four Horsemen of a Maintainability Crisis

#### 3.1.1 Declining Productivity

Features that once took days now require weeks. Estimation becomes increasingly inaccurate, and even top developers spend more time navigating the code than writing new features.

#### 3.1.2 Extending Onboarding Time

New team members, once productive in 2-3 weeks, now require months to understand the increasingly complex codebase. Knowledge silos develop, leading to fragility in critical areas.

#### 3.1.3 Quality Deterioration

As complexity increases, unit and integration tests become brittle. Bug counts rise, and quality suffers, often requiring more extensive verification and hotfixes.

#### 3.1.4 Developer Resistance

Developers begin to push back on new features, not out of obstinance, but as a signal of the system’s growing fragility.

### 3.2 Accepting the Inevitable Scale Limitations

Every system has its limits. A design that works for 1,000 users may collapse under 100,000. Accepting this is a part of the natural order of software evolution.

### 3.3 The Premature Optimization Trap

Building a system that “scales forever” often introduces unnecessary complexity. It is more pragmatic to design for a modest scale beyond current needs and then evolve incrementally.

### 3.4 Architectural Segmentation: The Key to Graceful Evolution

Design your system with clear boundaries so that components can be independently replaced. Use principles such as:
- **Domain Segregation:** Organize around business domains.
- **Interface Stability:** Maintain stable interfaces.
- **Data Independence:** Each component should own its data.
- **Capability Mapping:** Understand differing scaling requirements.

### 3.5 Planning for Transitions: The Strangulation Pattern

When a component nears its maintainability limit:
1. Build a new system alongside the old one.
2. Gradually shift functionality to the new system.
3. Decommission the old system once it no longer serves traffic.

### 3.6 Cultural Acceptance of Architectural Evolution

Foster a mindset that views rewrites not as failures, but as natural milestones in your company’s evolution. Normalizing an “architectural lifecycle” can help teams view these transitions positively.

### 3.7 Measuring and Monitoring Maintainability

Set up dashboards to track metrics such as feature velocity, support tickets, and code review observations. Early detection allows for proactive management of complexity.

### 3.8 Conclusion: Embracing the Rhythm of Renewal

Your software will grow more complex over time. Recognize maintainability breaks as natural indicators for change. By managing these transitions, you turn potential crises into milestones that propel your organization forward.

---

## 4. Team Structure and Planning: Managing the Complexity Dance

Balancing complexity and maintainability isn’t only about code—it’s about people and processes. The right team structure and planning processes are essential.

### 4.1 Development Team: The Custodians of Complexity

A well-structured development team does more than build features; it actively manages complexity. DevOps engineers, product owners, and even Scrum Masters all play critical roles in spotting maintainability issues before they escalate.

### 4.2 Planning and Evaluation: Balancing Value and Sustainability

At the planning stage, the company’s roadmap should include not only new features but also necessary architectural evolutions. Estimation should account for the current position on the complexity curve—what might take two weeks in a clean codebase could take six in a more complex one.

### 4.3 Monetizing the Invisible: Valuing Technical Work

Not all work directly generates revenue. To prioritize both features and technical improvements, assign monetary values to each:

#### 4.3.1 Valuation Framework: Making the Invisible Visible

- **Features:** Direct revenue, customer acquisition, or retention impact.
- **Technical Debt:** Development velocity impact and risk mitigation.
- **Customer Service Items:** Cost reduction in support and improved retention.

#### 4.3.2 Valuing Features

Combine revenue projections, churn reduction, and competitive positioning to estimate feature value.

#### 4.3.3 Valuing Technical Debt

Calculate the cost savings in developer-hours, risk mitigation, and future development costs.

#### 4.3.4 Valuing Customer Service Items

Assess support cost reductions and customer satisfaction improvements to quantify service-related work.

#### 4.3.5 Example: Valuing a Maintainability Break

For instance, if a module’s productivity has declined, increased onboarding times and quality issues may translate into a calculable loss in revenue. By breaking down these components, you create a clear business case for refactoring.

#### 4.3.6 Maintenance Budget: Ensuring Sustainable Balance

Set aside a fixed percentage (typically 20-30%) of development capacity specifically for maintainability work. This “maintenance budget” ensures that technical health is preserved even during periods of high feature demand.

### 4.4 Connecting Team Structure to Architectural Evolution

When a component reaches its limits, form a dedicated “pioneer team” to design and implement its successor. This allows the main team to continue maintaining the existing system while the new team works on the next iteration.

### 4.5 Measuring Success: Beyond Feature Delivery

Track metrics such as maintainability ratios, component health scores, developer satisfaction, and onboarding efficiency. These measurements help you assess not only feature delivery but also long-term architectural health.

### 4.6 Conclusion: People as Complexity Managers

The success of managing complexity lies in how teams are organized and how planning processes are structured. By aligning team responsibilities with technical evolution, you transform maintainability challenges into opportunities for sustainable growth.

---

## 5. Organizational Scaling: Maintaining Agility While Growing

As your software company expands, your organizational structure must evolve while preserving agility and clarity.

### 5.1 The Flat Structure Advantage

Flat organizational structures enable faster decision-making and greater developer autonomy. Fewer management layers reduce the risk of diluting technical context and slow decision-making.

### 5.2 The 10-Team Unit: A Natural Scaling Threshold

Experience shows that about 10 teams (roughly 40–70 people) is the natural unit for maintaining cohesion. Beyond this threshold, communication becomes more challenging and coordination costs rise.

### 5.3 Domain-Driven Organization: Aligning Teams with Architecture

Align team boundaries with business domains to create clear ownership and reduce coordination overhead.

#### 5.3.1 One Domain, One Team

Each domain (e.g., customer management, billing) should be owned by one dedicated team to build deep expertise and manage localized complexity.

#### 5.3.2 Multi-Domain Teams

In smaller organizations, a single team may manage multiple related domains. As the company grows, splitting these responsibilities can maintain focus and scalability.

### 5.4 Governance Through Interfaces, Not Oversight

Rather than adding layers of management, enforce well-defined interfaces between domains. This “contract” between teams supports autonomous work while ensuring system coherence.

### 5.5 Evolution of Roles as Organizations Scale

As organizations expand, roles such as Architects, HR Leads, and Product Managers evolve to address cross-unit concerns without adding unnecessary bureaucracy.

### 5.6 Handling Cross-Domain Features

For features that span multiple domains:
- **Feature Teams:** Temporarily form cross-domain teams for integration.
- **Domain Interface Extension:** Extend interfaces rather than merge implementations.
- **Service Coordination:** Create dedicated service teams for cross-cutting concerns like authentication or logging.

### 5.7 Scaling Case Study: From 5 to 80 Developers

A typical progression:
1. **5–15 Developers:** Fluid domains, shared responsibilities.
2. **15–40 Developers:** Defined domains with formal leadership roles.
3. **40–80 Developers:** Organizational splitting into units with clear interfaces.
4. **80+ Developers:** Multiple leadership triangles with additional coordination forums.

### 5.8 Conway’s Law and Architectural Evolution

Organizations design systems that mirror their communication structure. To shape your software architecture, intentionally design your organization accordingly—be it microservices, modular monoliths, or service-oriented systems.

### 5.9 Managing Organizational Rewrites

Just as technical systems need rewrites, so do organizations. Approach organizational restructuring incrementally and transparently to maintain continuity.

### 5.10 Conclusion: Organizations as Complex Adaptive Systems

Both your technical and organizational architectures must evolve together. A flat, domain-oriented structure governed by clear interfaces enables sustainable growth and adapts to complexity naturally.

---

## 6. Metrics and Governance: Measuring What Matters in Software Organizations

Measuring performance is essential to understanding where you stand and when to act. A layered metrics approach helps drive strategic decisions.

### 6.1 The Metrics Hierarchy: From Code to Strategy

Establish metrics at multiple levels:
1. **Code-level Metrics:** Technical health indicators.
2. **Team-level Metrics:** Productivity and delivery effectiveness.
3. **Product-level Metrics:** User impact and business outcomes.
4. **Strategic Metrics:** Organizational capability and market position.

### 6.2 Code-level Metrics: The Foundation

#### 6.2.1 Essential Code Metrics

- **Change Failure Rate:** Percentage of deployments causing incidents.
- **Deployment Frequency:** How often changes are safely deployed.
- **Mean Time to Recovery (MTTR):** Recovery time from failures.
- **Domain Coupling:** Degree of dependency between domains.
- **Test Coverage Trends:** Changes in testing coverage over time.
- **Code Churn by Component:** Frequency of changes in core components.

#### 6.2.2 Setting Up Code Metrics

Integrate metrics collection into your CI/CD pipeline, set up dashboards, establish baselines, and define thresholds that trigger investigations.

### 6.3 Team-level Metrics: Delivery Effectiveness

#### 6.3.1 Essential Team Metrics

- **Lead Time:** Time from idea to production.
- **Cycle Time:** Time from implementation start to deployment.
- **Flow Efficiency:** Proportion of active work versus waiting.
- **Work Item Age:** Duration current tasks remain open.
- **Escaped Defects:** Bugs discovered after deployment.
- **Planned-to-Unplanned Ratio:** Balance between planned work and reactive fixes.

#### 6.3.2 Setting Up Team Metrics

Utilize project management tools to track task transitions, conduct regular retrospectives, and analyze trends across sprints.

### 6.4 Product-level Metrics: User Impact

#### 6.4.1 Essential Product Metrics

- **Feature Usage:** Engagement levels with features.
- **User Satisfaction:** Customer satisfaction scores.
- **Retention:** User retention over time.
- **Performance:** System response times and error rates.
- **Support Volume:** Number of support requests.
- **Feature Time-to-Value:** How quickly users derive value from new features.

#### 6.4.2 Setting Up Product Metrics

Implement analytics to track feature usage, create in-product feedback mechanisms, and align support tickets with product areas.

### 6.5 Strategic Metrics: Organizational Capability

#### 6.5.1 Essential Strategic Metrics

- **Innovation Rate:** New capabilities delivered quarterly.
- **Technical Leverage:** Business value per development hour.
- **Architectural Adaptability:** Responsiveness to market changes.
- **Team Growth Efficiency:** Speed of effective new hire integration.
- **Competitive Response Time:** Speed of matching competitor innovations.
- **Technical Debt Ratio:** Proportion of capacity spent on maintenance versus innovation.

#### 6.5.2 Setting Up Strategic Metrics

Develop executive dashboards, conduct quarterly reviews, and benchmark against industry peers.

### 6.6 Governance: Taking Action on Metrics

Metrics are only valuable if they drive decisions. Establish a three-tiered governance framework:

#### 6.6.1 The Governance Framework

- **Team-level Governance:** Daily stand-ups, sprint reviews, and retrospectives.
- **Domain-level Governance:** Monthly reviews and architecture forums.
- **Strategic Governance:** Quarterly business reviews and major investment planning.

##### Team-level Governance

Daily and sprint-based decisions using team and code metrics.

##### Domain-level Governance

Monthly cross-team reviews and product council meetings to align on strategy.

##### Strategic Governance

Executive-level reviews to ensure overall technical and product alignment.

### 6.7 Trigger-Based Governance: When to Act

Define triggers for:
- **Investigation:** When metrics cross warning thresholds.
- **Intervention:** When metrics hit action thresholds.
- **Escalation:** When systemic issues appear.
- **Celebration:** When significant improvements occur.

### 6.8 Common Metrics Pitfalls

Be aware of issues such as:
- **Goodhart’s Law:** Measures become less useful when turned into targets.
- **Hawthorne Effect:** Behavior changes when being measured.
- **Proxy Problems:** Metrics are only proxies for true value.
- **Context Blindness:** Raw numbers need context.
- **Analysis Paralysis:** Too many metrics can hinder decision-making.

### 6.9 Metrics Evolution: Growth-Stage Appropriate Measurement

Adapt your metrics program as your organization grows:
1. **Startup Phase (5–15 developers):** Focus on product-market fit and basic delivery tempo.
2. **Growth Phase (15–40 developers):** Incorporate detailed team and domain health metrics.
3. **Scaling Phase (40–80 developers):** Implement comprehensive metrics and formal governance.
4. **Enterprise Phase (80+ developers):** Integrate cross-organizational metrics and specialized tooling.

### 6.10 Case Study: Metrics Driving Architectural Evolution

A financial services platform growing from 10 to 60 developers faced:
- Rising change failure rate (from 5% to 18%)
- Declining deployment frequency (from daily to weekly)
- Increasing lead times (from 3 to 8 weeks)
- High code churn in shared components

Using these metrics, the company incrementally transformed its architecture by:
1. Extracting high-churn components.
2. Establishing monthly domain reviews.
3. Prioritizing improvements based on deployment frequency.
4. Implementing a maintainability budget based on technical debt ratios.

Over 18 months, their metrics improved, validating the incremental transformation.

### 6.11 Conclusion: Metrics as a Strategic Asset

A robust metrics and governance framework is essential to sustain growth. When designed and used properly, metrics become the nervous system of your organization—detecting issues early and guiding strategic decisions.

