x = [20:10:80];

F1 = [0.52265, 0.68434, 0.71020, 0.75625, 0.77160, 0.78329, 0.81720];
recall = [0.36705, 0.54095, 0.56371, 0.62694, 0.64627, 0.67568, 0.72611];
precision = [0.90726, 0.93115, 0.93168, 0.93443, 0.93897, 0.95276, 0.95956];
accuracy = [0.90739, 0.93172, 0.93561, 0.94364, 0.95045, 0.95557, 0.96366];

plot(x,F1,'o-',x,recall,'o-',x,precision,'o-',x,accuracy,'o-')
title('TF-IDF Model Criteria')
xlabel('% of training set');
legend('F1 Score','recall','precision','accuracy');