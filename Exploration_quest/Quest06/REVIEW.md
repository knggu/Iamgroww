🔑 **PRT(Peer Review Template)**
- 코더 : 강임구
- 리뷰어 : 전다빈
- [O]  **1. 주어진 문제를 해결하는 완성된 코드가 제출되었나요?**
    - ```
prompt =  'An elderly man, gracefully attired in a classic black suit, stands amidst a dimly lit, antique-filled study. He holds a weathered book in one hand, while the soft glow of an ornate table lamp casts gentle shadows on the mahogany furniture'
negative_prompt =  'Dark, abstract, futuristic, minimalistic'

generator = torch.manual_seed(0)

m_images = [canny_image.resize((512, 512)), backbone_image.resize((512, 512))]```
    - ```gen_image = pipe(
    prompt,
    negative_prompt=negative_prompt,
    image = m_images,
    num_inference_steps = 35,
    generator = generator).images```
- [O]  **2. 전체 코드에서 가장 핵심적이거나 가장 복잡하고 이해하기 어려운 부분에 작성된 
주석 또는 doc string을 보고 해당 코드가 잘 이해되었나요?**
    - 네 그렇습니다.
    - ```# OpenposeDetector를 사용하여 인체 자세를 검출합니다. 
openpose = OpenposeDetector.from_pretrained("lllyasviel/ControlNet")
backbone_image = openpose(openpose_image)```

- [O]  **3. 에러가 난 부분을 디버깅하여 문제를 “해결한 기록을 남겼거나” 
”새로운 시도 또는 추가 실험을 수행”해봤나요?**
    - ![Alt text](image-1.png)
- [ ]  **4. 회고를 잘 작성했나요?**
    - 
- [O]  **5. 코드가 간결하고 효율적인가요?**
    - 노드에서 학습한 대로 간결하게 작성해주셨습니다.
