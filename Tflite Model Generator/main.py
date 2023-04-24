import tensorflow as tf
from tensorflow.keras.preprocessing.image import ImageDataGenerator
from tensorflow.keras.applications import MobileNetV2
from tensorflow.keras.layers import Dense, GlobalAveragePooling2D
from tensorflow.keras.models import Model

# Set the size of the input images
img_size = (224, 224)

# Preprocess the images
train_datagen = ImageDataGenerator(rescale=1./255)
train_generator = train_datagen.flow_from_directory(
    r"C:\Users\mavic\OneDrive\Desktop\GE_Eco_System",
    target_size=img_size,
    batch_size=32,
    class_mode='categorical')

# Load the MobileNetV2 model (without the top classification layer)
base_model = MobileNetV2(input_shape=(img_size[0], img_size[1], 3), include_top=False)

# Add a new classification layer on top of the base model
x = GlobalAveragePooling2D()(base_model.output)
x = Dense(5, activation='softmax')(x)
model = Model(inputs=base_model.input, outputs=x)

# Freeze the base model layers
for layer in base_model.layers:
    layer.trainable = False

# Compile the model
model.compile(optimizer='adam',
              loss='categorical_crossentropy',
              metrics=['accuracy'])

# Train the model on the training set
model.fit(train_generator, epochs=10)

# Evaluate the model on the validation set
validation_datagen = ImageDataGenerator(rescale=1./255)
validation_generator = validation_datagen.flow_from_directory(
    r'C:\Users\mavic\OneDrive\Desktop\GE_Eco_System\validation',
    target_size=img_size,
    batch_size=32,
    class_mode='categorical')
loss, accuracy = model.evaluate(validation_generator)

# Convert the model to a TensorFlow Lite model
converter = tf.lite.TFLiteConverter.from_keras_model(model)
tflite_model = converter.convert()

# Save the TensorFlow Lite model to a file
with open('model.tflite', 'Downloads') as f:
    f.write(tflite_model)