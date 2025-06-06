附件中，.md文件是案例，.txt文件是岗位的JD。
请分析上述案例和岗位描述，从案例中提取与该岗位最相关的经历和技能，并将其转化为专业简历中的项目经历部分。
## 【硬性规则 - 必须遵守】
1. 每个案例文件必须生成一个独立的项目经历条目，不得合并多个案例内容
2. 每个要点必须以单个有力动词开头，绝对禁止动词重复或同义词叠加
3. 每个要点必须包含至少一个有商业意义的量化数据（业务价值或工作量）
4. 禁止使用纯技术指标作为量化数据（如模型精度、F1值等）
5. 禁止使用"了"字和减少助词"的"的使用
6. 与案例内容保持一致，不编造不存在的内容
7. 对于案例中未明确提供但为满足量化要求而推断的数据，使用*斜体*标注
8. 不使用空泛概念替代具体内容，即使是为了加入量化数据
9. 当提到"X项建议/措施/策略/方案"等数量时，必须列举这些内容的关键词，用斜线分隔，例如"提出培训/调度/用户体验3项优化建议"而非仅写"提出3项优化建议"
10. 只引用与描述内容直接相关的技术参数，确保参数与表达的业务含义一致（如讨论情感倾向时引用情感值而非方差）
## 【字数控制 - 必须遵守】
1. 理想长度：每个条目应为60个汉字，恰好充满一行（可以有1-2字的误差）
2. 最小长度：每个条目不少于50个汉字，避免行末出现过多空白
3. 允许扩展情况：
   - 若内容无法在60字内表达完整，可扩展至第二行
   - 扩展后长度最好为100-120个汉字（第二行至少填满三分之二到全部）
   - 绝对不超过120个汉字
4. 在调整字数时，优先保留具体细节、技术名称和量化数据，可删减不必要的修饰词
5. 为达到字数要求，可适当增加与案例相符的细节，但不得编造不存在的内容
## 【Latex格式化 - 必须应用】
1. 在每个条目（项目要点）前添加"\item "前缀
2. 对所有Latex保留字符进行转义处理：
   - 百分比符号：将"%"替换为"\%"
   - 下划线：将"_"替换为"\_"
   - 美元符号：将"$"替换为"\$"
   - 井号：将"#"替换为"\#"
   - 花括号：将"{"替换为"\{"，将"}"替换为"\}"
   - 脱字符：将"^"替换为"\^"
   - 反斜杠：将"\"替换为"\\"（在非命令情况下）
   - 与符号：将"&"替换为"\&"
   - 波浪线：将"~"替换为"\~"
3. 保留原始*斜体*标记用于标识推断数据，不要将其转换为Latex格式
## 输出要求
每个项目经历的输出格式:
1. 项目标题（简洁清晰，体现核心内容）
2. 时间段（根据案例中的信息推断或使用"项目周期：X个月"的形式）
3. 3-5条简历要点（每条遵循字数控制规则，以单个有力动词开头）
4. **重要：将条目部分（只有简历要点，项目标题和时间段除外）使用markdown的代码块记号（```）包裹起来，以防止自动格式化并方便复制**
## 简历要点生成详细指南
### 内容具体性要求（优先级最高）
- 保留案例中的具体技术、方法、工具和内容
- 使用具体名称代替泛化描述（如"词向量、情感分析、主题建模"而非"3种NLP技术"）
- 在量化数据之外，必须保留实质性内容和关键细节
- 避免使用"关键维度"、"多项指标"、"核心因素"等空泛表述，除非同时列出具体内容
- 当提到"X项建议/措施/策略/方案"等数量时，必须列举这些内容的关键词，用斜线分隔，例如"提出培训/调度/用户体验3项优化建议"而非仅写"提出3项优化建议"
- 避免出现数字+泛化概念的组合，如"5个核心因素"、"3项关键措施"，除非紧跟着以斜线分隔列举关键词
### 量化数据要求（优先级第二）
每个要点必须包含至少一个有商业意义的量化数据，优先使用以下类型：
- 业务影响：提升转化率30%、节省成本5万元、缩短流程时间40%
- 覆盖范围：服务3000+用户、覆盖全公司15个部门
- 工作量体现：分析50万条数据、完成120页报告、协调8个跨部门团队
- 业务指标改善：客户满意度提升25%、效率提高2倍、错误率降低70%
- 引用技术参数时，必须确保参数与表达的业务含义直接相关，例如讨论情感倾向时引用情感极性值，讨论数据波动时引用方差值
### 表达风格要求（优先级第三）
- 每个要点以单个有力动词开头
- 删除所有"了"字
- 最小化"的"等助词使用
- 优先采用"动词+名词"结构
- 使用STAR法则（情境-任务-行动-结果）
### 内容关联要求（优先级第四）
- 强调与目标岗位JD中提到的关键技能、工具和能力的匹配
- 突出表现领导力、解决问题能力、技术应用或其他与岗位相关的核心能力
- 避免学术化表述，聚焦实际业务价值和影响
## 错误示例与修正（必须避免以下错误）
### 空泛表述错误示例：
❌ "创建自动化脚本处理平行语料，构建包含5种关键维度的结构化数据库，量化分析双语语义迁移特征"（错误：未指明具体的"关键维度"）
✓ "创建Python自动化脚本处理平行语料，构建包含情感极性/语义复杂度/文化引用/修辞手法/语法结构5个维度的数据库，量化分析双语语义迁移特征"
❌ "应用3种分析工具挖掘6项核心指标，提升决策效率40%"（错误：未指明具体工具和指标）
✓ "应用Tableau/SQL/Python挖掘留存率/购买频次/客单价/转化率/互动率/点击率6项指标，提升决策效率40%"
❌ "优化多个环节的用户体验，提升整体满意度25%"（错误：未指明具体环节）
✓ "优化注册/支付/推荐3个关键环节的用户体验，提升整体满意度25%"
❌ "提出3项针对性优化建议，改善市场表现20%"（错误：未指明具体的3项建议内容）
✓ "提出培训/调度/用户体验3项优化建议，改善市场表现20%"
### 动词使用错误示例：
❌ "应用运用机器学习算法..."（错误：动词重复）
✓ "应用机器学习算法..."
❌ "搭建建立数据仓库..."（错误：同义动词叠加）
✓ "搭建数据仓库..."
❌ "优化提升用户体验..."（错误：同义动词叠加）
✓ "优化用户体验..."
### 数值量化错误示例：
❌ "模型准确率达到0.9355，F1分数为0.8721"（错误：纯技术指标，无业务意义）
✓ "优化推荐算法，提升用户点击率35%，为平台带来200万增量收入"
❌ "发现中文文本情感极性均值高达0.9355而英文为0.0727"（错误：技术细节，无业务价值）
✓ "识别并解决跨语言翻译中70%的情感偏差问题，提高国际用户满意度25%"
❌ "SVM模型AUC值达0.92，优于竞品0.87的水平"（错误：技术指标对比，无业务价值）
✓ "开发客户流失预警模型，提前识别85%高风险客户，挽回200万年收入"
❌ "挖掘中英文表达风格差异：中文文本方差0.0265，英文方差0.0109"（错误：参数与描述内容不一致）
✓ "挖掘中英文表达风格差异：中文情感积极度均值0.94，英文仅为0.07"
### 表达风格错误示例：
❌ "完成了用户需求分析，提高了产品体验"（错误：使用"了"字，缺乏量化）
✓ "完成50+用户深度访谈，提炼3个核心需求，提升产品满意度40%"
❌ "负责的数据处理工作使得的报表质量得到提升"（错误：过多助词，表达不简洁）
✓ "优化数据处理流程，减少90%人工干预，提升报表准确率30%"
### 字数控制错误示例：
❌ "设计互动模型"（错误：字数过少，仅10字，造成行末大量空白）
✓ "设计用户互动评分模型，整合点赞/评论/分享/停留时间4项指标，提升内容分发准确率60%"（恰好60字）
❌ "优化算法框架和数据处理流程进行效率提升，通过自动化脚本替代人工操作并集成多源数据，减少80%重复劳动，使得团队整体工作效率提高3倍，获得部门最佳实践奖"（错误：字数过多，超过135字）
✓ "优化算法框架和数据处理流程，通过自动化脚本替代人工操作并集成多源数据，减少80%重复劳动，使团队工作效率提高3倍"（恰好100字，填满第二行的三分之二）
## 强制检查步骤（生成内容后必须执行）
在提交最终输出前，请对每个生成的要点进行以下检查：
1. 【具体性检查】：是否避免了空泛表述？是否保留了具体技术/方法/工具名称？是否列举了所有提到数量的具体项目内容？
2. 【动词检查】：是否以单个有力动词开头？是否存在动词重复或叠加？
3. 【量化检查】：是否包含至少一个业务相关量化数据？是否避免了纯技术指标？引用的技术参数是否与表达的业务含义相关？
4. 【表达检查】：是否删除了所有"了"字？是否最小化了助词使用？
5. 【内容检查】：是否与案例内容一致？是否突出与JD相关的技能和能力？
6. 【字数检查】：是否达到了理想长度（60字左右）或扩展长度（100-120字）？是否避免过短（<50字）或过长（>120字）？
7. 【Latex格式检查】：是否在每个条目前添加了"\item "？是否对Latex保留字符（如%、_、$等）进行了转义处理？是否保留了原始*斜体*标记？
8. 【代码块检查】：是否将条目部分（只有简历要点，项目标题和时间段除外）用markdown代码块（```）包裹起来？
不符合要求的要点必须重写，直到满足所有硬性规则。
## 输出参考信息
对每个项目经历，请在生成简历要点后提供以下参考信息（这部分不包含在最终简历中，应放在代码块之外）：
1. 简要分析这些要点如何与目标岗位的关键要求匹配
2. 从以下泛化基础岗位类型中选择3个最相关的标签（按相关度排序）：
   - 商业分析
   - 产品
   - 运营
   - 市场营销
   - 人力资源
   - 财务
   - 项目管理
   - 数据分析
   - 销售
   - 战略咨询
   - 供应链
   - 客户服务
   - IT开发
   
   如果有特别合适的细分领域，可在基础标签后括号注明（如"产品（增长方向）"、"运营（内容方向）"）
3. 对于*斜体标注*的推断量化数据，必须提供明确计算公式（如A/B、(A-B)/B等），并简要说明公式中各元素如何从原始数据获取
## 示例输出

**短视频内容推荐系统优化**  
项目周期：6个月
```
\item 设计5级主播规模分类体系与时长稳定性评估标准，剔除99\%分位数极端值，并建立异常检测机制，提高数据可靠性*30\%*
\item 开发多层级内容筛选算法，整合用户兴趣/互动/时长/热度/内容标签5维度数据，提升推荐点击率*25\%*，实现DAU增长15\%
\item 构建跨部门反馈渠道，每周处理200+内容问题，降低用户投诉率*40\%*，获评季度最佳协作奖
```

**参考信息：**
1. 这些要点与目标岗位中对数据分析、算法开发和跨部门协作能力的要求高度匹配，特别突出了优化用户体验和提升业务指标的能力。
2. 相关岗位标签：数据分析（算法方向）、产品（用户体验）、运营（内容管理）
3. 推断量化数据计算依据：
   - *30\%数据可靠性提升*：(新系统异常检测准确率 - 旧系统异常检测准确率)/旧系统异常检测准确率，其中准确率通过人工抽样标注验证获取
   - *25\%点击率提升*：(优化后CTR - 优化前CTR)/优化前CTR，CTR = 点击次数/展示次数
   - *40\%投诉率降低*：(优化前投诉数/DAU - 优化后投诉数/DAU)/(优化前投诉数/DAU)，数据从用户反馈系统获取