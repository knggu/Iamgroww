## AIFFEL Campus Online Code Peer Review Templete
- 코더 : 강임구
- 리뷰어 : 이혁희


## PRT(Peer Review Template)
- [X]  **1. 주어진 문제를 해결하는 완성된 코드가 제출되었나요?**
    - VGG16을 베이스 모델로 하여 Transfer Learning을 실행하였습니다.
    ```
    model.summary()
    
    Model: "sequential"
    _________________________________________________________________
     Layer (type)                Output Shape              Param #   
    =================================================================
     vgg19 (Functional)          (None, 6, 6, 512)         20024384  

     global_average_pooling2d (G  (None, 512)              0         
     lobalAveragePooling2D)                                          

     dense (Dense)               (None, 1024)              525312    

     dropout (Dropout)           (None, 1024)              0         

     dense_1 (Dense)             (None, 512)               524800    

     dense_2 (Dense)             (None, 512)               262656    

     dense_3 (Dense)             (None, 5)                 2565      

    =================================================================
    Total params: 21,339,717
    Trainable params: 1,315,333
    Non-trainable params: 20,024,384
    _________________________________________________________________
    ```
    
    - 학습과정과 결과를 시각적으로 제시하였습니다.
        - 예측값/Label, 정답여부, 정답의 이미지 보여주기
        ```
        plt.figure(figsize=(20, 12))

        for idx, (image, label, prediction) in enumerate(zip(images, labels, predictions)):
            plt.subplot(4, 8, idx+1)
            image = (image + 1) / 2
            plt.imshow(image)
            correct = label == prediction
            title = f'real: {label} / pred :{prediction}\n {correct}!'
            if not correct:
                plt.title(title, fontdict={'color': 'red'})
            else:
                plt.title(title, fontdict={'color': 'blue'})
            plt.axis('off')
        ```
        - Loss/Accucy의 변화를 그래프로 보여주기
        ```
        acc = history.history['accuracy']
        val_acc = history.history['val_accuracy']

        loss=history.history['loss']
        val_loss=history.history['val_loss']

        epochs_range = range(24)

        plt.figure(figsize=(12, 8))
        plt.subplot(1, 2, 1)
        plt.plot(epochs_range, acc, label='Training Accuracy')
        plt.plot(epochs_range, val_acc, label='Validation Accuracy')
        plt.legend()
        plt.title('Training and Validation Accuracy')
        plt.ylim([0, 1])
        plt.xlim([1, 25])

        plt.subplot(1, 2, 2)
        plt.plot(epochs_range, loss, label='Training Loss')
        plt.plot(epochs_range, val_loss, label='Validation Loss')
        plt.legend()
        plt.title('Training and Validation Loss')
        plt.ylim([0, 1])
        plt.xlim([1, 25])

        plt.show()
        ```

    - Test Accuracy 86.1%로 루브릭 기준 85%를 초과하였습니다.
    ```
    test_loss, test_accuracy = model.evaluate(test_batches)
    print(f'Loss: {test_loss},\nAccuracy: {test_accuracy}')
    
    Loss: 0.42108452320098877,
    Accuracy: 0.8610354065895081
    ```
    
- [X]  **2. 전체 코드에서 가장 핵심적이거나 가장 복잡하고 이해하기 어려운 부분에 작성된 
주석 또는 doc string을 보고 해당 코드가 잘 이해되었나요?**
    - 예. Dense Layer를 깊게 쌓아서 성능 개선하려는 아이디어가 좋았고 실제로 효과가 있었습니다.
        - 제가 같은 VGG16모델을 베이스모델로 학습했을 때(dense layer 2개)보다 성능이 높게 나옵니다.
        - 좋은 아이디어 감사합니다.
    ```
    dense_layer = tf.keras.layers.Dense(1024, activation='relu')
    dropout_layer = tf.keras.layers.Dropout(0.3)
    dense_layer2 = tf.keras.layers.Dense(512, activation='relu')
    dense_layer3 = tf.keras.layers.Dense(512, activation='relu')
    
    prediction_layer = tf.keras.layers.Dense(5, activation='softmax')
    
    base_model.trainable = False
    
    model = tf.keras.Sequential([
      base_model,
      global_average_layer,
      dense_layer,
      dropout_layer,
      dense_layer2,
      dense_layer3,
      prediction_layer
    ])
    ```
        
- [X]  **3. 에러가 난 부분을 디버깅하여 문제를 “해결한 기록을 남겼거나” 
”새로운 시도 또는 추가 실험을 수행”해봤나요?**
    - Data Augmentation을 적용하여 추가로 실험하였습니다.
    ```
    def augment(image,label):
        image = tf.image.random_flip_left_right(image)  # 랜덤하게 좌우를 반전합니다.
        return image,label
    
    #데이터 파이프라인
    #shuffle 무작위 요소 선택
    #repeat 여러번 데이터셋을 사용할 수 있게 만듬
    #batch 배치사이즈에 맞게 데이터 나눔

    def prepare_for_training(ds, shuffle_buffer_size):
        # augment 적용 부분이 배치처리 함수에 추가되었습니다.
        ds = ds.map(
                augment,       # augment 함수 적용(좌우반전)
                num_parallel_calls=2
            )
        ds = ds.shuffle(buffer_size=shuffle_buffer_size)
        ds = ds.batch(BATCH_SIZE)
        ds = ds.prefetch(buffer_size=AUTOTUNE)
        return ds

    train_ds = prepare_for_training(train, 1050)
    val_ds = prepare_for_training(validation, 120)
    ```
        
- [X]  **4. 회고를 잘 작성했나요?**
    - 코드 마지막에 주석으로 잘한 점, 힘들었던 점, 고칠 점을 작성하였습니다.
    - 다음부터 형식을 좀더 잘 지켜서 작성해 주시면 좋겠습니다.^^
    ```
    #여러 파라미터 중 Epoch은 10~35로 다양하게 나타나서 35까지 주고 다른 파라미터 변화를 줌
    #dense_layer를 처음엔 512짜리 2개만 쌓았다가, flower에 더 치우치도록 3개와 dropdout까지 쌓아봄
    #처음엔 shuffle buffer size를 train만 10% 줬는데, validation과 test까지 포함하여 30%까지 바꾸어봄
    #생각보다 85% 넘기기가 힘들다는걸... 느낌
    #학습 데이터 전처리에서 다양성을 주는 방법을 더 찾아보아야겠음(노드에서 좌우반전 회전을 배웠음)        
    ```
        
- [X]  **5. 코드가 간결하고 효율적인가요?**
    - 노드에서 제시된 코드를 이용하여 문제에 맞게 잘 적용하였습니다.
    ```
    dense_layer = tf.keras.layers.Dense(1024, activation='relu')
    dropout_layer = tf.keras.layers.Dropout(0.3)
    dense_layer2 = tf.keras.layers.Dense(512, activation='relu')
    dense_layer3 = tf.keras.layers.Dense(512, activation='relu')
    ```

## 총평
- Transfer Learning을 하면서 Dense Layer를 깊이 쌓아서 학습 효율을 높이려고 한 시도가 좋았습니다.
- VGG16은 다른 Base Model에 비해서(예를 들어 ResNet50)에 비해서 복잡도가 낮은 모델이다 Classifier를 좀더 깊게 했을 때 효과가 좋은 것 같습니다. 
- 좋은 아이디어를 배웠습니다. 감사합니다.


## 참고 링크 및 코드 개선
```
# 코드 리뷰 시 참고한 링크가 있다면 링크와 간략한 설명을 첨부합니다.
# 코드 리뷰를 통해 개선한 코드가 있다면 코드와 간략한 설명을 첨부합니다.
```
