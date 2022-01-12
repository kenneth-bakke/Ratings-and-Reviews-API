import csv

def getHeaders(files):
  for file in files:
    with open(file, 'r') as infile:
      reader = csv.DictReader(infile)
      fieldnames = reader.fieldnames
      print('\n')
      print(file[14:])
      for field in fieldnames:
        print(field)

files = [
  './clean-data-1/characteristic_reviews.csv',
  './clean-data-1/questions.csv',
  './clean-data-2/reviews.csv',
  './clean-data-2/styles.csv',
  './clean-data-3/answers_photos.csv',
  './clean-data-3/answers.csv',
  './clean-data-3/product.csv',
  './clean-data-3/reviews_photos.csv',
  './clean-data-4/cart.csv',
  './clean-data-4/characteristics.csv',
  './clean-data-4/features.csv',
  './clean-data-4/photos.csv',
  './clean-data-4/related.csv',
  './clean-data-4/skus.csv'
]

getHeaders(files)