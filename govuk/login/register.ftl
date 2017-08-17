<#import "template.ftl" as layout>
<@layout.registrationLayout; section>
    <#if section = "title">
        ${msg("registerWithTitle",(realm.displayName!''))}
    <#elseif section = "header">
        ${msg("registerWithTitleHtml",(realm.displayNameHtml!''))}
    <#elseif section = "back">
        <a class="link-back" href="${url.loginUrl}">${msg("backToLogin")}</a>
    <#elseif section = "form">
        <form id="kc-register-form" class="${properties.kcFormClass!}" action="${url.registrationAction}" method="post">
          <input type="text" readonly value="this is not a login form" style="display: none;">
          <input type="password" readonly value="this is not a login form" style="display: none;">

          <#if !realm.registrationEmailAsUsername>
            <div class="${properties.kcFormGroupClass!} ${messagesPerField.printIfExists('username',properties.kcFormGroupErrorClass!)}">
                <div class="${properties.kcLabelWrapperClass!}">
                    <label for="username" class="${properties.kcLabelClass!}">${msg("createUsername")}</label>
                </div>
                <div class="${properties.kcInputWrapperClass!}">
                    <input type="text" id="username" class="${properties.kcInputClass!}" name="username" value="${(register.formData.username!'')?html}" />
                </div>
            </div>
          </#if>
            <div class="${properties.kcFormGroupClass!} ${messagesPerField.printIfExists('firstName',properties.kcFormGroupErrorClass!)}">
                <div class="${properties.kcLabelWrapperClass!}">
                    <label for="firstName" class="${properties.kcLabelClass!}">${msg("firstName")}</label>
                </div>
                <div class="${properties.kcInputWrapperClass!}">
                    <input type="text" id="firstName" class="${properties.kcInputClass!}" name="firstName" value="${(register.formData.firstName!'')?html}" />
                </div>
            </div>

            <div class="${properties.kcFormGroupClass!} ${messagesPerField.printIfExists('lastName',properties.kcFormGroupErrorClass!)}">
                <div class="${properties.kcLabelWrapperClass!}">
                    <label for="lastName" class="${properties.kcLabelClass!}">${msg("lastName")}</label>
                </div>
                <div class="${properties.kcInputWrapperClass!}">
                    <input type="text" id="lastName" class="${properties.kcInputClass!}" name="lastName" value="${(register.formData.lastName!'')?html}" />
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-2 col-md-2">
                    <label for="user.attributes.street" class="control-label">${msg("street")}</label>
                </div>

                <div class="col-sm-10 col-md-10">
                    <input type="text" class="form-control" id="user.attributes.street" name="user.attributes.street" value="${(register.formData.street!'')?html}"/>
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-2 col-md-2">
                    <label for="user.attributes.locality" class="control-label">${msg("locality")}</label>
                </div>

                <div class="col-sm-10 col-md-10">
                    <input type="text" class="form-control" id="user.attributes.locality" name="user.attributes.locality" value="${(register.formData.locality!'')?html}"/>
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-2 col-md-2">
                    <label for="user.attributes.region" class="control-label">${msg("region")}</label>
                </div>

                <div class="col-sm-10 col-md-10">
                    <input type="text" class="form-control" id="user.attributes.region" name="user.attributes.region" value="${(register.formData.region!'')?html}"/>
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-2 col-md-2">
                    <label for="user.attributes.postal_code" class="control-label">${msg("postal_code")}</label>
                </div>

                <div class="col-sm-10 col-md-10">
                    <input type="text" class="form-control" id="user.attributes.postal_code" name="user.attributes.postal_code" value="${(register.formData.postal_code!'')?html}"/>
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-2 col-md-2">
                    <label for="user.attributes.country" class="control-label">${msg("country")}</label>
                </div>

                <div class="col-sm-10 col-md-10">
                    <input type="text" class="form-control" id="user.attributes.country" name="user.attributes.country" value="${(register.formData.country!'')?html}"/>
                </div>
            </div>
            <div class="${properties.kcFormGroupClass!} ${messagesPerField.printIfExists('email',properties.kcFormGroupErrorClass!)}">
                <div class="${properties.kcLabelWrapperClass!}">
                    <label for="email" class="${properties.kcLabelClass!}">${msg("email")}</label>
                </div>
                <div class="${properties.kcInputWrapperClass!}">
                    <input type="text" id="email" class="${properties.kcInputClass!}" name="email" value="${(register.formData.email!'')?html}" />
                </div>
            </div>

            <#if passwordRequired>
            <div class="${properties.kcFormGroupClass!} ${messagesPerField.printIfExists('password',properties.kcFormGroupErrorClass!)}">
                <div class="${properties.kcLabelWrapperClass!}">
                    <label for="password" class="${properties.kcLabelClass!}">${msg("createPassword")}</label>
                </div>
                <div class="${properties.kcInputWrapperClass!}">
                    <input type="password" id="password" class="${properties.kcInputClass!}" name="password" />
                </div>
            </div>

            <div class="${properties.kcFormGroupClass!} ${messagesPerField.printIfExists('password-confirm',properties.kcFormGroupErrorClass!)}">
                <div class="${properties.kcLabelWrapperClass!}">
                    <label for="password-confirm" class="${properties.kcLabelClass!}">${msg("passwordConfirm")}</label>
                </div>
                <div class="${properties.kcInputWrapperClass!}">
                    <input type="password" id="password-confirm" class="${properties.kcInputClass!}" name="password-confirm" />
                </div>
            </div>
            </#if>

            <#if recaptchaRequired??>
            <div class="form-group">
                <div class="${properties.kcInputWrapperClass!}">
                    <div class="g-recaptcha" data-size="compact" data-sitekey="${recaptchaSiteKey}"></div>
                </div>
            </div>
            </#if>

            <div class="${properties.kcFormGroupClass!}">
                <div id="kc-form-buttons" class="${properties.kcFormButtonsClass!}">
                    <input class="${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonLargeClass!}" type="submit" value="${msg("doRegister")}"/>
                </div>
            </div>
        </form>
    </#if>
</@layout.registrationLayout>
