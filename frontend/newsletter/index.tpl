{extends file="parent:frontend/newsletter/index.tpl"}

        {block name="frontend_newsletter_content"}
            
            {if $voteConfirmed == false || $sStatus.code == 0}
            <div class="newsletter--form panel has--border is--rounded" data-newsletter="true">
              
                {* Newsletter headline *}
                {block name="frontend_newsletter_content_headline"}
                  {* if URL parameter ?signout=true show signout form *}
                  {if $smarty.get.signout}
                    <h2 class="panel--title is--underline">{s name="sNewsletterOptionUnsubscribe"}Unsubscribe Newsletter{/s}</h2>
                  {else}
                    <h2 class="panel--title is--underline">{s name="NewsletterRegisterHeadline"}Subscribe Newsletter{/s}</h2>
                  {/if}
                {/block}

                {* Newsletter form *}
                {block name="frontend_newsletter_form"}
                    <form id="nl2go_form" method="post">
                        <div class="panel--body is--wide">

                            {* Email *}
                            {block name="frontend_newsletter_form_input_email"}
                                <div class="newsletter--email">
                                    <input name="newsletter" type="email" placeholder="{s name="sNewsletterPlaceholderMail"}Emailaddress{/s}{s name="RequiredField" namespace="frontend/register/index"}*{/s}" required="required" aria-required="true" value="{if $smarty.post.newsletter}{$smarty.post.newsletter|escape}{elseif $smarty.get.sNewsletter}{$smarty.get.sNewsletter|escape}{/if}" class="input--field is--required{if $sStatus.sErrorFlag.newsletter} has--error{/if}"/>
                                </div>
                            {/block}
                            
                            {* Additional fields *}
                            {block name="frontend_newsletter_form_additionalfields"}
                                <div class="newsletter--additional-form">

                                  {if {config name=NewsletterExtendedFields} && !$smarty.get.signout}                                
                                        {* Firstname *}
                                        {block name="frontend_newsletter_form_input_firstname"}
                                            <div class="newsletter--firstname">
                                                <input name="firstname" type="text" placeholder="{s name="NewsletterRegisterPlaceholderFirstname"}Firstname{/s}" value="{$smarty.post.firstname|escape}" class="input--field{if $sStatus.sErrorFlag.firstname} has--error{/if}"/>
                                            </div>
                                        {/block}
                                        
                                        {* Lastname *}
                                        {block name="frontend_newsletter_form_input_lastname"}
                                            <div class="newsletter--lastname">
                                                <input name="lastname" type="text" placeholder="{s name="NewsletterRegisterPlaceholderLastname"}Lastname{/s}" value="{$smarty.post.lastname|escape}" class="input--field{if $sStatus.sErrorFlag.lastname} has--error{/if}"/>
                                            </div>
                                        {/block}
                                        
                                        {* Gender *}
                                        {block name="frontend_newsletter_form_input_gender"}
                                            <div class="newsletter--gender select-field">
                                                <select name="gender" class="field--select">
                                                    <option value="" {if $smarty.post.gender eq ""}selected="selected"{/if}>{s name='NewsletterRegisterPlaceholderGender'}Choose your Gender{/s}</option>
                                                    <option value="f"{if $smarty.post.gender eq "f"} selected="selected"{/if}>{s name='NewsletterRegisterPlaceholderGenderF'}Female{/s}</option>
                                                    <option value="m"{if $smarty.post.gender eq "m"} selected="selected"{/if}>{s name='NewsletterRegisterPlaceholderGenderM'}Male{/s}</option>
                                                </select>
                                            </div>
                                        {/block}

                                  {/if}
                            
                                </div>
                            {/block}

                            {* Required fields hint *}
                            {block name="frontend_newsletter_form_required"}
                                <div class="newsletter--required-info">
                                    {s name='RegisterPersonalRequiredText' namespace="frontend/register/personal_fieldset"}* Required fields{/s}
                                </div>
                            {/block}

                            {* Data protection information *}
                            {block name="frontend_newsletter_form_privacy"}
                                {if {config name=ACTDPRTEXT} || {config name=ACTDPRCHECK}}
                                    {include file="frontend/_includes/privacy.tpl"}
                                {/if}
                            {/block}

                            {* Submit button *}
                            {block name="frontend_newsletter_form_submit"}
                                {* Error Messages *}
                                <div id="n2g-message">
                                  <p class="success is--hidden">
                                    {s name="NewsletterRegisterSuccess"}Subscribe was successful{/s}
                                  </p>
                                  <p class="signout is--hidden">
                                    {s name="NewsletterSignOutSuccess"}Unsubscribe was successful{/s}
                                  </p>
                                  <p class="signout-invalid is--hidden">
                                    {s name="NewsletterSignoutInvalid"}Emailaddress unknown{/s}
                                  </p>
                                  <p class="already-signedup is--hidden">
                                    {s name="NewsletterRegisterAlreadySignedup"}Emailadress already signed up.{/s}
                                  </p>
                                  <p class="error is--hidden">
                                      {s name="NewsletterRegisterError"}Error, please try again.{/s}
                                  </p>
                                </div>
                                <div class="newsletter--action">
                                    <button type="submit" class="btn is--primary right is--icon-right" name="{s name="sNewsletterButton"}Send{/s}">
                                        {s name="sNewsletterButton"}Send{/s}
                                    </button>
                                </div>
                            {/block}
                            
                            {block name="frontend_newsletter_form_switch"}
                                {* Signout / Signin Switch *}
                                {if $smarty.get.signout}
                                  <p>{s name="sNewsletterOptionSubscribeLink"}<a href="/shopware.php?sViewport=newsletter">go to subscription form</a>{/s}</p>
                                {else}
                                  <p>{s name="sNewsletterOptionUnsubscribeLink"}<a href="/shopware.php?sViewport=newsletter&signout=true">go to unsubscription form</a>{/s}</p>
                                {/if}
                            {/block}
                        </div>
                    </form>
                {/block}
            </div>
            {/if}
        {/block}