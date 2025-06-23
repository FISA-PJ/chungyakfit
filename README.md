## 우리 FISA 4기 AI 엔지니어링 3조

정명희(팀장), 박재림, 이태민, 주정우, 차민재

---

## 📌 프로젝트 소개

**청약핏**은 복잡한 주택청약 특별공급 정보를 쉽고 빠르게 제공하는 AI 기반 맞춤형 플랫폼입니다.  
기존 플랫폼이 제공하지 못한 ‘청약 자격유형 자동 판별’,‘맞춤 대출 추천’, ‘AI 챗봇 상담을 통한 공고문 이해’를 통해 청약 경험이 부족한 사용자도 효율적으로 정보에 접근할 수 있게 돕습니다.

![Image](https://github.com/user-attachments/assets/f66c73d7-2210-47a6-8411-4000065bbb3d)

---

## 🧩 주요 기능

- 🎯 **맞춤형 공고 필터링**  
  사용자 입력 정보를 저장한 뒤, 특별공급 세부 유형을 자동 판별하여 맞춤 공고를 제공합니다.

- 🤖 **AI 챗봇 상담 서비스**  
  청약 공고 관련 질문에 대해 RAG 기반 검색, LangGraph, ReAct Agent, Reranker 등 최신 기술을 활용해 복합질문까지 정확히 응답합니다.

- 💰 **스마트 대출 추천**  
  사용자의 조건과 공고 내용을 바탕으로 주택담보대출 상품을 추천하며, 월 예상 상환액을 계산합니다.  
  단순화된 Rule-Based 방식으로 LTV 기준을 적용합니다.

---

## 🎯 주요 타겟 고객

- 다자녀 가구, 노부모 부양 가구 등 특별공급 대상자
- 청약 지식이 부족한 사회초년생 및 소외계층
- 바쁜 일정으로 청약 정보 탐색이 어려운 직장인

---

## ⚙️ 시스템 아키텍처 및 구현 요약

![Image](https://github.com/user-attachments/assets/49a0e1ac-c68d-4714-8a48-e88b8b5774f1)

### 📑 데이터 파이프라인

- **LH 사이트 공고문(PDF) 및 상세내용 자동 크롤링**
- **RAG용 파이프라인 (매일 자정 실행)**: PDF 수집 → 전처리 → ElasticSearch 적재  
- **웹 서비스용 파이프라인 (새벽 3:30 실행)**: 웹 상세내용 → MySQL 적재  
- 적재 실패 시 별도 디렉토리 기록 및 인적 보완

### 🔎 공고문 전처리

- Upstage Document Parser → Parsing, Chunking, Embedding  
- 표 구조와 문맥 유지로 검색 정확도 향상

### 🤖 AI 챗봇 및 대출 추천

- **LangGraph**: 대화 흐름 제어  
- **ReAct Agent**: 복합 질문 단계별 추론  
- **Reranker**: 검색 결과 재정렬 최적화  
- **REST API**: 백엔드와 챗봇 서버 연동

---

## 👤 페르소나

**김신혼 (신혼부부)**  
> “청약 신청은 처음인데... 신혼부부용 공고는 뭐지?”  
> “LTV? DSR? 이런 건 처음 들어봐…”

**박자녀 (다자녀 가구)**  
> “일도 바쁘고 육아도 하느라 공고 볼 시간이 없어.”  
> “월 납입 금액 정도는 미리 알고 싶다.”

### 📹 시연 영상 보러가기
[페르소나 기반 시연 영상 보러가기](https://www.youtube.com/watch?v=VIV1HL572ns)

---

## 🎯 기대 효과

- 복잡한 청약 공고를 누구나 이해할 수 있도록 단순화
- 정보 접근성 개선 → 청약 기회의 형평성 확대
- 공고 필터링 + 대출 추천 + 챗봇 응답으로 청약 준비 시간 대폭 단축

---

## 💸 수익 모델

- 💳 금융 제휴 수수료 (대출, 보증보험)
- ⭐ 프리미엄 구독 (고급 리포트, 우선 알림, 전담 상담)
- 🏠 생활 제휴 수익 (이사, 인테리어, 가전 연계)

---

## 🧑‍💻 팀 구성 및 역할

| 이름     | 역할      | 담당 업무 |
|----------|-----------|-----------|
| 정명희   | 팀장      | 대출 추천 시스템 구축 |
| 박재림   | 팀원      | AI 모델 테스트, 인프라 구축, Airflow-DB 연동, CI/CD |
| 이태민   | 팀원      | DB 설계, 데이터 파이프라인 구축, CI/CD |
| 주정우   | 팀원      | Spring 백엔드 개발 및 운영, DB 연동, LLM 챗봇 Fast API 연동 |
| 차민재   | 팀원      | 공고문 파싱, RAG 기반 AI 모델 설계·구현, LangGraph·ReAct Agent 구현 |

---

## 🗓️ 프로젝트 일정

- **총 7주 (2025.04.21 ~ 2025.06.09)**  
  - 1주차: 사전 기획  
  - 2주차: 데이터 수집, Airflow 구성  
  - 3~4주차: 챗봇 개발, 공고 파싱, 대출 추천 기능  
  - 5~7주차: 백엔드 및 서비스 연동, 테스트 및 개선

---

## 🔧 개선 및 보완 계획

- 청약 공고 소스 다양화 (SH, GH, 청약홈 등)
- 오픈소스 모델 교체 및 프롬프트 고도화
- 대출 상품 확장, 위시리스트 기능 추가
- Helm 기능 도입 및 배포 안정성 강화

---

## 🎓 성과 및 학습 경험

- DB 트랜잭션/프로시저 기반 워크플로우 연동 학습
- LangGraph & ReAct Agent 구성 이해 및 적용
- Spring 기반 API 흐름 이해 (Controller-Service-Repo 구조)
- Jenkins + Docker + K8s를 통한 클라우드 배포 자동화 경험

---

# Tech Stack

## Front / Backend
**Backend**

<img src="https://img.shields.io/badge/java-007396?style=for-the-badge&logo=OpenJDK&logoColor=white"> <img src="https://img.shields.io/badge/Spring-6DB33F?style=for-the-badge&logo=Spring&logoColor=white"> <img src="https://img.shields.io/badge/springboot-6DB33F?style=for-the-badge&logo=springboot&logoColor=white"> 

**Frontend**

<img src="https://img.shields.io/badge/HTML5-E34F26?style=for-the-badge&logo=HTML5&logoColor=white"> <img src="https://img.shields.io/badge/CSS3-1572B6?style=for-the-badge&logo=CSS3&logoColor=white"> <img src="https://img.shields.io/badge/JavaScript-F7DF1E?style=for-the-badge&logo=JavaScript&logoColor=white">

## ML-Backend
**Chatbot**

![FastAPI](https://img.shields.io/badge/fastapi-009688.svg?&style=for-the-badge&logo=fastapi&logoColor=white)  ![LangChain](https://img.shields.io/badge/LangChain-1C3C3C?style=for-the-badge&logo=langchain&logoColor=white) ![RAG](https://img.shields.io/badge/RAG-FF6B6B?style=for-the-badge&logo=opensearch&logoColor=white) ![React Agent](https://img.shields.io/badge/React_Agent-61DAFB?style=for-the-badge&logo=react&logoColor=black) ![LangGraph](https://img.shields.io/badge/LangGraph-FF4B4B?style=for-the-badge&logo=neo4j&logoColor=white) ![Reranker](https://img.shields.io/badge/Reranker-4CAF50?style=for-the-badge&logo=elasticsearch&logoColor=white)

**Data Preprocessing**

 ![Apache Airflow](https://img.shields.io/badge/Apache_Airflow-017CEE?style=for-the-badge&logo=apacheairflow&logoColor=white) ![OpenParser](https://img.shields.io/badge/OpenParser-FF8C00?style=for-the-badge&logo=json&logoColor=white) ![Upstage](https://img.shields.io/badge/Upstage-6B73FF?style=for-the-badge&logo=tensorflow&logoColor=white) ![Elasticsearch](https://img.shields.io/badge/elasticsearch-005571.svg?&style=for-the-badge&logo=elasticsearch&logoColor=white)  ![MySQL](https://img.shields.io/badge/mysql-4479A1.svg?&style=for-the-badge&logo=mysql&logoColor=white) 
## Infra
**Monitoring**

<img src="https://img.shields.io/badge/grafana-%23F46800.svg?style=for-the-badge&logo=grafana&logoColor=white"> <img src="https://img.shields.io/badge/Prometheus-E6522C?style=for-the-badge&logo=Prometheus&logoColor=white">  <img src="https://img.shields.io/badge/Elasticsearch-005571?style=for-the-badge&logo=Elasticsearch&logoColor=white">  <img src="https://img.shields.io/badge/Kibana-005571?style=for-the-badge&logo=Kibana&logoColor=white">  <img src="https://img.shields.io/badge/Fluentd-0E83C8?style=for-the-badge&logo=fluentd&logoColor=white">

**CI/CD**

![Jenkins](https://img.shields.io/badge/Jenkins-D24939?style=for-the-badge&logo=jenkins&logoColor=white) ![Webhook](https://img.shields.io/badge/Webhook-2F3C4C?style=for-the-badge&logo=webhook&logoColor=white) ![Docker](https://img.shields.io/badge/Docker-2496ED?style=for-the-badge&logo=docker&logoColor=white) ![Kubernetes](https://img.shields.io/badge/Kubernetes-326CE5?style=for-the-badge&logo=kubernetes&logoColor=white) 

**Container Orchestration**

![Docker](https://img.shields.io/badge/Docker-2496ED?style=for-the-badge&logo=docker&logoColor=white) ![Amazon EKS](https://img.shields.io/badge/Amazon_EKS-FF9900?style=for-the-badge&logo=amazoneks&logoColor=white)

**AWS Cloud Infrastructure**

![AWS](https://img.shields.io/badge/AWS-FF9900?style=for-the-badge&logo=amazonaws&logoColor=white) ![Amazon EKS](https://img.shields.io/badge/Amazon_EKS-FF9900?style=for-the-badge&logo=amazoneks&logoColor=white) ![Route 53](https://img.shields.io/badge/Route_53-FF9900?style=for-the-badge&logo=amazonroute53&logoColor=white) ![Amazon VPC](https://img.shields.io/badge/Amazon_VPC-FF9900?style=for-the-badge&logo=amazonvpc&logoColor=white) ![AWS Bedrock](https://img.shields.io/badge/AWS_Bedrock-FF9900?style=for-the-badge&logo=amazonwebservices&logoColor=white) ![Internet Gateway](https://img.shields.io/badge/Internet_Gateway-FF9900?style=for-the-badge&logo=amazonwebservices&logoColor=white) ![NAT Gateway](https://img.shields.io/badge/NAT_Gateway-FF9900?style=for-the-badge&logo=amazonwebservices&logoColor=white)

---

> 당신에게 딱 맞는 청약, **청약핏**이 쉽게 알려드릴게요.
