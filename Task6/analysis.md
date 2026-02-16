# Отчёт по результатам анализа Kubernetes Audit Log

## Подозрительные события

1. Доступ к секретам:
    - Кто: "username": "minikube-user", "impersonatedUser": "system:serviceaccount:secure-ops:monitoring"
    - Где: "namespace": "kube-system"
    - Почему подозрительно: Попытка выполнить list на секреты закончилась ошибкой 403 Forbidden. Попытка неавторизованного доступа 

2. Привилегированные поды:
    - Кто: "username": "minikube-user"
    - Комментарий: Запуск привелегированного контейнера может позволить получить расширенный доступ к ресурсам хоста 

3. Использование kubectl exec в чужом поде:
    - Кто: "username": "minikube-user"
    - Что делал: namespaces/kube-system/pods/coredns-66bc5c9577-fwjgb/exec?command=cat&command=%2Fetc%2Fresolv.conf&container=coredns
      - Успешная попытка получить содержимое /etc/resolv.conf контейнера codedns из неймспейса kube-system

4. Создание RoleBinding с правами cluster-admin:
    - Кто: "username": "minikube-user"
    - К чему привело: Запрос привёл к изменению прав доступа, что может предоставить пользователю дополнительные права на неймспейс. Конкретные назначенные роли не зарегистрированы в логе.

5. Удаление audit-policy.yaml:
    - Не выполнено: resource mapping not found for name: "" namespace: "" from "./audit-policy.yaml": no matches for kind "Policy" in version "audit.k8s.io/v1"

## Вывод

...
