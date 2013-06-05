directive.directive('uiValidateEquals',

  () ->
    {
      restrict: 'A'
      require: 'ngModel'
      link: (scope,elm,attrs,ctrl) ->
        validateEqual = (myValue,otherValue) ->
          if(myValue == otherValue)
            ctrl.$setValidity('equal', true)
            return myValue
          else
            ctrl.$setValidity('equal', false)
            return undefined
        scope.$watch(attrs.uiValidateEquals, (otherModelValue) ->
          validateEqual(ctrl.$viewValue, otherModelValue)
        )

        ctrl.$parsers.unshift((viewValue) ->
          return validateEqual(viewValue, scope.$eval(attrs.uiValidateEquals))
        )

        ctrl.$formatters.unshift((modelValue) ->
          return validateEqual(modelValue, scope.$eval(attrs.uiValidateEquals))
        )

    }
)
