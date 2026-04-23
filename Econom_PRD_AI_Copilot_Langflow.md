# Product Requirements Document (PRD) — Экономическая модель IT-стартапа

**Версия:** 1.1
**Статус:** Финальная редакция
**Дата:** 2026-04-23
**Связанный документ:** `Final_PRD_AI_Copilot_Langflow.md` (продуктовая и техническая часть)

---

## Введение

Этот документ описывает требования для создания финансовой и экономической модели IT-стартапа **AI Copilot Platform для Langflow** — платформы, которая позволяет бизнес-пользователям создавать, валидировать и запускать рабочие процессы (workflow) на основе ввода на естественном языке без участия разработчиков.

Экономическая модель должна отражать реальные драйверы стоимости продукта, описанные в технической части PRD:
- **LLM-затраты** как крупнейшая переменная статья OPEX (токены, кэширование промптов, мульти-модельная стратегия).
- **Двухплановая архитектура** (Control Plane + Execution Plane) с требованиями к изоляции тенантов и наблюдаемости.
- **Команда из 13 ролей** (10 Core + 3 Extended), описанная в §25 технического PRD.
- **Гибридная детерминированно-агентная архитектура** с компонентами Planner, Evaluator, Policy Guard, Validation Engine.
- **Четыре уровня корректности** и **семь стадий валидации**, создающие стоимость через доверие, но требующие вычислительных и человеческих ресурсов.

Документ будет использоваться командой для разработки и обоснования экономической модели, которая будет основой для принятия решений о запуске, масштабировании и привлечении инвестиций.

---

## 1. Цели и задачи проекта

### 1.1 Основная цель
- Разработать и обосновать экономическую модель для платформы **AI Copilot для Langflow**, которая превращает бизнес-задачи на естественном языке в исполняемые workflow.
- Определить жизнеспособность проекта с точки зрения финансов с учётом специфики AI-продукта: высоких переменных LLM-расходов, необходимости human-in-the-loop валидации, мульти-тенантной изоляции и регулируемой обработки данных (PII/конфиденциальные данные).
- Обосновать инвестиционный запрос с реалистичной экономикой на единицу (unit economics) — «стоимость одного успешно выполненного workflow».

### 1.2 Задачи
- **Оценить CAPEX запуска** (команда до MVP, инфраструктура Control/Execution Plane, интеграции).
- **Оценить OPEX операционной фазы** с разбивкой на фиксированную часть (команда, инфраструктура) и переменную часть (LLM-токены, connector egress, human review).
- **Разработать модель монетизации** с учётом мульти-тенантной SaaS-природы и регулируемых сценариев использования.
- **Произвести оценку и анализ рисков** — как финансовых, так и продуктовых (согласно §24 технического PRD).
- **Прогнозировать доходность и возврат инвестиций (ROI, Payback, IRR)**.
- **Оценить unit economics** (CAC, LTV, gross margin per workflow).
- **Оценить возможности и стоимость масштабирования** (стоимость добавления коннектора, стоимость добавления тенанта, стоимость нового use case).
- **Подготовить инвестиционный запрос** с разбивкой по этапам (MVP → Pilot → GA → Scale).
- **Принять решения Make vs Buy** по ключевым компонентам (LLM-провайдеры, vector store, evaluation framework, compliance tooling).

---

## 2. Этапы работы и план

### 2.1 Этап 1: Анализ начальных условий

#### 2.1.1 Задачи
- Изучить рынок AI-платформ для автоматизации бизнес-процессов (low-code/no-code + LLM) и определить целевую аудиторию.
- Проанализировать конкурентов: Langflow (OSS), Flowise, Dust, Retool AI, Zapier AI, Relevance AI, Scale GenAI Platform, Microsoft Copilot Studio.
- Оценить потребности пользователей с учётом пяти поддерживаемых use case из §10 технического PRD:
  - §10.1 Аналитика разговоров (conversation analytics) — первичный MVP use case.
  - §10.2 Анализ документов и корпусов (document/corpus analysis).
  - §10.3 Операционный мониторинг (operations monitoring).
  - §10.4 Качество поддержки и базы знаний (knowledge/support quality).
  - §10.5 Запланированные регулярные workflow (scheduled workflows).

#### 2.1.2 Требования
- Провести исследование рынка, выделить основные сегменты пользователей.
- Определить **персоны** из §5 технического PRD:
  - Руководитель CX/Support (первичная).
  - Ops-менеджер.
  - Продуктовый/Data аналитик (в режиме Advanced review).
  - Администратор платформы (в режиме Operator/Admin).
- Оценить потребности в автоматизации для выбранных отраслей (банки, ритейл, здравоохранение, телеком) с учётом регуляторных ограничений (GDPR, HIPAA, CCPA, 152-ФЗ).
- Оценить объем рынка (TAM/SAM/SOM) и его потенциальный рост.
- Оценить **готовность рынка платить** за каждый use case — conversation analytics имеет более высокий WTP, чем generic automation.

#### 2.1.3 Специалисты
- Маркетолог/аналитик рынка
- Продуктовый менеджер
- Domain Expert (CX / Support / Ops) — для валидации бизнес-сценариев

---

### 2.2 Этап 2: Разработка финансовой модели

#### 2.2.1 Задачи
- Прогнозировать затраты на запуск и разработку продукта с учётом **13-ролевой команды** (§25 технического PRD).
- Рассчитать операционные расходы с разделением на **фиксированную** (команда, базовая инфраструктура) и **переменную** (LLM-токены, storage, egress, human review).
- Оценить источники дохода с учётом мульти-тенантной SaaS-модели.
- Разработать прогноз денежных потоков и рентабельности по месяцам и по когортам клиентов.

#### 2.2.2 Требования

1. **CAPEX запуска (до MVP)**:
   - **Фонд оплаты труда** для 10 Core-ролей: Product Manager, UX/Product Designer, AI Architect, Solution Architect, Backend Engineer(s), Langflow Engineer, DevOps/SRE, Security/Privacy Engineer, Data/Analytics Engineer, Evaluation/Applied Scientist.
   - **Extended-роли** (могут быть part-time или fractional): Domain Expert, Solutions Engineer, Technical Writer.
   - **Инфраструктура Control Plane**: оркестрация, Registry/Metadata Service, задачи-очереди, audit log.
   - **Инфраструктура Execution Plane**: Langflow-воркеры, изоляция по тенантам, checkpointing, secret vault.
   - **Интеграции коннекторов** для MVP (минимум 3–5: источники разговоров — CRM/helpdesk, SharePoint/Confluence, Slack, Email, S3).
   - **Лицензии и API**: LLM-провайдеры (OpenAI, Anthropic, Google, локальные модели), vector store, observability (Datadog/Grafana), secrets (Vault/AWS KMS).
   - **Юридическое оформление**: DPA с клиентами, GDPR/152-ФЗ compliance аудит, SOC 2 Type I подготовка.

2. **OPEX операционной фазы**:

   **Фиксированная часть**:
   - Команда (ФОТ + налоги + benefits).
   - Базовая инфраструктура Control Plane (всегда работает).
   - Лицензии SaaS-инструментов (observability, CI/CD, communication).
   - Офис/remote stipends, юридическая поддержка, бухгалтерия.

   **Переменная часть (главный риск-драйвер)**:
   - **LLM-токены** — доминирующая статья для AI-продукта. Требует детального моделирования:
     - Токены Planner Agent (генерация плана из task spec).
     - Токены Evaluator/Critic (семантическая валидация результата).
     - Токены Intent Parser и Clarification Manager.
     - Токены Report Generator (группировка и сводка).
     - Policy & Abuse Guard (классификация запросов).
     - **Кэширование промптов** — позволяет снизить стоимость повторных запросов (Anthropic prompt cache TTL 5 минут, OpenAI caching).
     - **Мульти-модельная стратегия**: дорогие модели (Opus, GPT-4) для Planner/Evaluator; дешёвые (Haiku, GPT-4o-mini) для классификации; локальные модели для PII-redaction.
   - **Execution Plane compute** — Langflow-воркеры (масштабируются по нагрузке).
   - **Storage**: checkpoint'ы, audit log, результаты workflow, vector store.
   - **Egress**: загрузка данных из коннекторов (CRM, S3, базы данных).
   - **Human review** — стоимость эксперта Domain Expert на валидацию бизнес-корректности (§18.2.4 техн. PRD).

3. **Доходы (модели монетизации)**:
   - **SaaS-подписка по тенантам** (ежемесячная/ежегодная) с tier'ами: Starter / Team / Business / Enterprise.
   - **Usage-based pricing** — плата за исполненный workflow или за pool «токенов платформы» (абстракция над реальными LLM-токенами).
   - **Гибридная модель**: база + переменная часть за превышение квот.
   - **Enterprise-контракты** с SLA, изолированным deployment (single-tenant), кастомными коннекторами.
   - **Marketplace шаблонов workflow** (долгосрочно, после GA).

4. **Финансовые показатели**:
   - NPV, IRR, ARR, MRR, Payback Period, CASH FLOW.
   - **Gross margin per tenant** и **per workflow execution** — критично для AI SaaS.
   - **Burn rate** и **runway** с учётом переменных LLM-расходов.
   - Чувствительность к цене LLM-токенов (может снизиться на 30–50% в год при появлении новых моделей).

#### 2.2.3 Специалисты
- Финансовый аналитик
- Экономист
- Бухгалтер или налоговый консультант
- AI Architect — для оценки токенных бюджетов и мульти-модельной стратегии
- DevOps/SRE — для оценки инфраструктурных расходов

---

### 2.3 Этап 3: Оценка рисков и разработка стратегий минимизации

#### 2.3.1 Задачи
- Провести анализ чувствительности к ключевым переменным: стоимость LLM-токенов, retention клиентов, скорость закрытия enterprise-сделок.
- Оценить **технические и продуктовые риски** из §24 технического PRD и их финансовые последствия.
- Оценить риски внешней среды: конкуренция (Microsoft Copilot Studio, OpenAI Agents), регуляторные изменения (AI Act, новые требования к PII), экономические изменения.
- Разработать стратегии минимизации рисков.

#### 2.3.2 Требования

1. **Финансовая оценка продуктовых рисков** (§24 технического PRD):
   - **Risk 1**: Генерация некорректных workflow → стоимость human review + репутационный риск → моделируется через «cost of rework».
   - **Risk 2**: Hallucination в результатах → стоимость Evaluator/Critic (дополнительные LLM-токены на валидацию).
   - **Risk 3**: Проблемы производительности при scale → стоимость autoscaling и checkpoint storage.
   - **Risk 4**: Непокрытие нишевых use case → риск churn → снижение LTV.
   - **Risk 5**: Security/PII-инциденты → прямые штрафы (GDPR до 4% выручки), стоимость mitigation.
   - **Risk 6**: Высокие LLM-расходы → риск отрицательной unit economics → требует мульти-модельной стратегии.
   - **Risk 7**: Сложность onboarding новых коннекторов → снижение скорости expansion sales.
   - **Risk 8**: Abuse и troll-запросы → стоимость Policy Guard + compute на отклонённые запросы.

2. **Оценка рисков**:
   - Три сценария: **pessimistic** (LLM-цены не снижаются, adoption медленный, 1 коннектор/квартал), **base**, **optimistic** (цены падают 30%/год, viral adoption, marketplace-эффект).
   - Прогноз сценариев ухудшения или улучшения на 12/24/36 месяцев.

3. **Стратегии минимизации**:
   - Мульти-модельная стратегия (снижение LLM-зависимости от одного вендора).
   - Prompt caching и retrieval augmentation для снижения токенов.
   - Tiered pricing с hard quota — перенос риска переменных расходов на клиента для крупных workflow.
   - Approved-registry коннекторов (§13.11 техн. PRD) — снижение поддерживаемой surface area.
   - Usage governance через Resource Budgets per tenant (§20.5 техн. PRD).

#### 2.3.3 Специалисты
- Специалист по рискам
- Юрист (compliance GDPR, 152-ФЗ, AI Act)
- Security / Privacy Expert
- Консультант по стратегии

---

### 2.4 Этап 4: Масштабирование и долгосрочная устойчивость

#### 2.4.1 Задачи
- Оценить, как проект будет развиваться с увеличением числа **тенантов**, **пользователей на тенант**, **workflow в месяц**, **коннекторов** и **use cases**.
- Прогнозировать возможности роста и масштабирования с учётом двухплановой архитектуры.
- Оценить возможные затраты на расширение инфраструктуры и команды.

#### 2.4.2 Требования

1. **Многомерное масштабирование** (§20.5 технического PRD):
   - **Tenants**: стоимость добавления нового тенанта (минимальная инфраструктура изоляции, onboarding).
   - **Users per tenant**: стоимость роста DAU внутри тенанта (LLM-токены, human review).
   - **Workflow executions per month**: главный unit — стоимость масштабируется с нагрузкой.
   - **Connectors**: стоимость разработки и поддержки нового коннектора (Solutions Engineer + approval pipeline).
   - **Use cases**: стоимость добавления нового use case (Domain Expert + taxonomy + benchmarks + templates).
   - **Compute/storage**: прогноз с учётом checkpointing, audit log retention, vector store scale.
   - **Regions/tenants in EU/RU**: стоимость регионального соответствия (data residency).

2. **Долгосрочная устойчивость**:
   - Расчёт срока стабилизации unit economics (gross margin > 60% на workflow).
   - Прогноз снижения LLM-стоимости (historical trend: ~30–50% год).
   - Оценка насыщения рынка (conversation analytics), возможность expansion в соседние use case.
   - Эффект обучения: Evaluator/Planner улучшаются на исторических данных → снижение retry rate → снижение переменных расходов.
   - Стратегия **Product-led growth** vs **Sales-led growth** и их влияние на CAC/LTV.

#### 2.4.3 Специалисты
- Solution Architect
- DevOps/SRE (scaling capacity planning)
- Операционный менеджер
- Финансовый аналитик

---

### 2.5 Этап 5: Подготовка к привлечению инвестиций

#### 2.5.1 Задачи
- Подготовить инвестиционный запрос для внешнего финансирования с разбивкой по **фазам** согласно §26 технического PRD:
  - **Фаза 0–1** (MVP conversation analytics): сколько, на что, сроки.
  - **Фаза 2** (Pilot с 3–5 клиентами).
  - **Фаза 3** (GA + 2-й use case).
  - **Фаза 4** (Scale — marketplace, регионы).
- Рассчитать требуемые объемы инвестиций по раундам (Seed / Series A / Series B).
- Оценить доходность для инвесторов.

#### 2.5.2 Требования

1. **Инвестиционный запрос по фазам**:
   - **Seed (Фаза 0–1, 6–9 мес.)**: MVP для conversation analytics, 10 Core-ролей, 3 коннектора, 1 pilot-клиент.
   - **Series A (Фаза 2–3, 12–18 мес.)**: масштабирование команды до 13 ролей, 10 коннекторов, 3 use case, 20 клиентов, SOC 2 Type II.
   - **Series B (Фаза 4)**: международная экспансия, marketplace, self-serve tier.
   - Для каждой фазы — milestone'ы, которые unlock'ают следующий раунд.

2. **Бизнес-план для инвесторов** должен включать:
   - Финансовые прогнозы на 5 лет (P&L, Cash Flow, Balance).
   - Unit economics по когортам.
   - Comparable benchmarks (Dust, Retool AI, Zapier AI — ARR multiples).
   - Ключевые KPI: ARR, NRR, gross margin, CAC payback, magic number.
   - Обоснование moat: доверие (Evaluator + evidence), approved-registry, domain-специфичные таксономии.

3. **Прогноз доходности для инвесторов**:
   - Payback Period, IRR, Cash-on-Cash multiple.
   - Exit-сценарии: стратегическая продажа (Salesforce, ServiceNow, Zendesk, Sber), IPO.

#### 2.5.3 Специалисты
- Специалист по венчурным инвестициям
- Финансовый аналитик
- Маркетолог
- CEO/Founder

---

## 3. Финансовая модель

### 3.1 Затраты

#### 3.1.1 Разработка (CAPEX)
- ФОТ 10 Core-ролей + 3 Extended-роли (частично).
- Инфраструктура MVP: Control Plane + Execution Plane (starter configuration).
- Интеграции первых 3–5 коннекторов.
- Юридическое оформление (DPA, compliance).

#### 3.1.2 Операционные расходы (OPEX)
- **Фиксированные**:
  - ФОТ команды.
  - Базовая инфраструктура Control Plane (24/7).
  - Лицензии SaaS (observability, CI/CD, communications, vault).
  - Офис / remote stipends.
- **Переменные (ключевой драйвер)**:
  - **LLM-токены** (см. §3.5 ниже).
  - Execution Plane compute (autoscaling воркеры).
  - Storage и egress.
  - **Human review** со стороны Domain Expert.

#### 3.1.3 Маркетинг и продажи
- Content marketing (workflow examples, white-papers на тему AI в CX).
- Inside sales + AE для enterprise-сделок.
- Events, conferences, case studies.
- Paid ads (узкотаргетированные, LinkedIn).

#### 3.1.4 Прочие расходы
- Налоги, юридические услуги.
- Compliance-аудиты (SOC 2, ISO 27001).
- Страхование (cyber, E&O).

### 3.2 Доходы

- **SaaS-подписка** с tier'ами:
  - Starter (малые команды, ограниченные квоты).
  - Team (средние команды, больше коннекторов).
  - Business (неограниченные workflow до лимита, SSO, audit export).
  - Enterprise (SLA, single-tenant, кастом-коннекторы, приоритетный support).
- **Usage overage** — плата за превышение квот workflow/токенов.
- **Professional services** — внедрение, кастомные коннекторы, тренинги (low-margin, но ускоряют onboarding).
- **Marketplace шаблонов workflow** (долгосрочно).

### 3.3 Финансовые показатели

- **NPV** (Чистая приведённая стоимость).
- **IRR** (Внутренняя норма доходности).
- **ARR / MRR**.
- **Gross Margin** (общий и per workflow).
- **CAC, LTV, LTV/CAC**.
- **NRR (Net Revenue Retention)** — критично для SaaS.
- **CAC Payback Period**.
- **Magic Number** (эффективность S&M).
- **Burn Multiple**.
- **Cash Flow** по месяцам.

### 3.4 Сезонность и цикличность
- B2B SaaS имеет выраженный Q4-эффект (бюджеты на следующий год).
- Сезонность по use case: conversation analytics в ритейле пиковое в Q4/Q1.

### 3.5 Юнит-экономика workflow (новое)

Ключевой unit для AI-продукта — **один успешно выполненный workflow**. Разложение стоимости:

| Компонент | Драйвер | Типовая стоимость |
|-----------|---------|-------------------|
| Intent Parser + Clarification | Короткие LLM-вызовы | низкая |
| Planner Agent | Большая модель, длинный контекст | средняя–высокая |
| Validation Engine (7 стадий) | Mix: детерминистика + LLM | средняя |
| Execution (Langflow) | Compute + connector egress | варьируется по workflow |
| Evaluator/Critic | LLM-вызовы на семантическую валидацию | средняя |
| Report Generator | LLM-вызовы на генерацию отчёта | средняя |
| Audit/Observability | Storage + processing | низкая |
| Human review | Domain Expert часы (редко) | высокая, но редкая |

**Оптимизации для улучшения gross margin**:
- Prompt caching (до −40% на повторные Planner-вызовы).
- Мульти-модельная стратегия: Haiku/4o-mini для классификации, Opus/GPT-4 только для Planner/Evaluator.
- Локальные модели для PII-redaction и Policy Guard.
- Retrieval-based IR (§16 техн. PRD) вместо inline context.
- Checkpoint-восстановление для длинных workflow (экономия на retry).

---

## 4. Методы анализа

### 4.1 Анализ чувствительности
Ключевые переменные для sensitivity:
- **Стоимость LLM-токенов** (±50% vs baseline).
- **Средний объём токенов на workflow** (оптимизация промптов, caching).
- **Retention клиентов** (месячный и годовой churn).
- **Average Contract Value (ACV)** по tier'ам.
- **CAC** (inbound vs outbound).
- **Скорость добавления коннекторов** и её влияние на expansion.

### 4.2 SWOT-анализ
- **Strengths**: двухплановая архитектура, Evaluator + evidence модель, approved-registry, 4 уровня корректности.
- **Weaknesses**: зависимость от LLM-вендоров, сложность onboarding, требует Domain Expert'а клиента.
- **Opportunities**: рост рынка AI agents, marketplace-эффект, регионализация (EU/RU data residency).
- **Threats**: Microsoft/OpenAI вертикальная интеграция, open-source альтернативы (Langflow OSS сам по себе), регуляторные изменения.

### 4.3 Сценарный анализ (новое)
Три сценария на 36 месяцев:

- **Pessimistic**: LLM-цены стабильны, median ACV ниже плана, churn 2%/мес, adoption медленный.
  - Результат: extended runway требование, Series A откладывается на 6 мес.

- **Base**: LLM-цены −20%/год, median ACV по плану, churn 1%/мес.
  - Результат: плановый Path to $10M ARR на 30 мес.

- **Optimistic**: LLM-цены −40%/год, viral adoption в CX-сегменте, marketplace-эффект.
  - Результат: ранняя Series A на upmarket valuation.

### 4.4 Связка продуктовых метрик с финансовыми (новое)
Метрики из §22 технического PRD имеют прямые финансовые последствия:

- **p95 execution latency** ↓ → выше retention → выше LTV.
- **Retry rate** ↓ → ниже переменная стоимость за workflow → выше gross margin.
- **Semantic correctness rate** ↑ → ниже нагрузка на human review → ниже OPEX.
- **Abuse block rate** ↓ (false positives) → выше user satisfaction → ниже churn.
- **Evidence coverage rate** ↑ → выше доверие → выше expansion revenue.

---

## 5. Make vs Buy (новое)

Критические решения по компонентам:

| Компонент | Make | Buy | Решение |
|-----------|------|-----|---------|
| LLM (Planner/Evaluator) | — | OpenAI/Anthropic/Google | **Buy + multi-vendor** |
| Langflow (runtime) | Форк/вклад в OSS | Хостед Langflow | **Make** (форк + вклад) |
| Vector store | Pgvector / Milvus OSS | Pinecone, Weaviate | **Buy на MVP, Make на scale** |
| Secrets vault | — | HashiCorp Vault, AWS KMS | **Buy** |
| Observability | Prometheus/Grafana OSS | Datadog, New Relic | **Hybrid** (OSS для custom метрик, SaaS для основного) |
| PII-redaction | — | Presidio OSS + custom | **Make on top of OSS** |
| Evaluator framework | Собственная реализация | Ragas, DeepEval | **Make** (связано с §18 техн. PRD — уникальный IP) |
| Policy Guard | Собственная реализация | Guardrails AI, Nemo | **Make** (связано с доменной таксономией) |
| Auth/SSO | — | WorkOS, Okta | **Buy** (WorkOS для enterprise readiness) |

---

## 6. Сценарии по MVP-скоупу (новое)

MVP ограничен согласно §26 технического PRD. Финансовые последствия:

- **Scope**: только conversation analytics (§10.1), 3 коннектора, 1 LLM-провайдер (резерв второй).
- **Команда**: 10 Core-ролей fully-staffed, 3 Extended-ролей fractional.
- **Срок**: 6–9 месяцев до закрытого Pilot.
- **Бюджет MVP**: оценивается отдельно, но порядок — **команда × 6–9 мес + инфраструктура + LLM-квоты на разработку и pilot**.

**Расширения после MVP** (дополнительные инвестиции):
- +1 use case (§10.2 / §10.3) — +1 Domain Expert sprint + +N недель разработки.
- +1 коннектор — +Solutions Engineer недели + approval pipeline (Security + Architect).
- +регион (EU/RU data residency) — +DevOps sprint + юридическая проверка.

---

## 7. Human-in-the-loop расходы (новое)

Платформа сознательно держит человека в цикле валидации бизнес-корректности (§18.2.4 техн. PRD). Это создаёт **стоимостную статью**, которой нет в чисто deterministic SaaS:

- **Внутренние Domain Expert'ы** (со стороны платформы) для эталонных бенчмарков и калибровки Evaluator.
- **Domain Expert'ы на стороне клиента** — их время валидации workflow учитывается в TCO клиента и влияет на WTP.
- **Моделирование**: % workflow, требующих human review, × средняя стоимость часа эксперта × средний объём на review.
- **Цель оптимизации**: снизить этот % через обучение Evaluator на исторических данных, но никогда до нуля (регулируемые use case требуют ручного подтверждения).

---

## 8. Требования к документации

### 8.1 Презентация
Презентация для защиты проекта и инвесторов должна содержать:
- Product overview + ссылка на `Final_PRD_AI_Copilot_Langflow.md`.
- TAM/SAM/SOM.
- Unit economics одного workflow.
- Финансовые прогнозы на 3–5 лет.
- Сценарный анализ (pessimistic/base/optimistic).
- Make vs Buy решения.
- Команда и roadmap по фазам.
- Размер раунда и use of funds.

### 8.2 Отчеты
- **Финансовая модель в Excel/Google Sheets** с подробным расчётом по месяцам на 5 лет, driver-based (LLM-цена, объём токенов, ACV, churn, CAC — отдельные assumption-листы).
- **Cohort analysis** по клиентам.
- **Scenario tabs** (pessimistic / base / optimistic).
- **Unit economics dashboard** с per-workflow gross margin.
- **Sensitivity tables** по ключевым переменным.

### 8.3 Дополнительные артефакты
- **Pricing model document** с обоснованием tier'ов и overage.
- **Investor memo** (10–15 стр.) с фокусом на moat и unit economics.
- **Compliance & risk register** — связан с §24 технического PRD.

---

## 9. Заключение

Этот документ служит основой для разработки экономической модели **AI Copilot Platform для Langflow**. В отличие от классического SaaS-стартапа, экономика AI-продукта требует детального моделирования **переменных LLM-расходов**, **human-in-the-loop стоимости** и **multi-dimensional scaling** (тенанты, коннекторы, use case).

Ключевые принципы для финансовой модели:
1. **Driver-based** — все цифры должны выводиться из assumption'ов (цена токена, % human review, CAC, churn), а не задаваться top-down.
2. **Согласованность с техническим PRD** — команда, архитектура, use case и метрики должны зеркалиться между документами.
3. **Чувствительность к LLM-ценам** — главный внешний фактор, должен быть отдельным sensitivity-параметром.
4. **Unit economics как primary lens** — инвесторы оценивают AI SaaS по gross margin per workflow, а не только по ARR.
5. **Рискообоснованность** — каждый продуктовый риск из §24 технического PRD должен иметь финансовую оценку и стратегию митигации.

Команда должна обеспечить максимальную точность в расчётах и синхронизацию с продуктовым и техническим PRD на каждом этапе.
