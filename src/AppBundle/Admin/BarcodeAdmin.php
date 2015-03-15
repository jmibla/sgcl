<?php
/**
 * Created by PhpStorm.
 * User: jmb
 * Date: 28/02/15
 * Time: 20:46
 */

namespace AppBundle\Admin;

use Sonata\AdminBundle\Admin\Admin;
use Sonata\AdminBundle\Datagrid\DatagridMapper;
use Sonata\AdminBundle\Datagrid\ListMapper;
use Sonata\AdminBundle\Form\FormMapper;
use Sonata\AdminBundle\Show\ShowMapper;
//Para el uso del tipo de dado "codetype"
use AppBundle\Form\Type;

class BarcodeAdmin extends Admin
{

    protected $baseRouteName = 'barcode';

    protected $baseRoutePattern = 'barcode';

    protected $datagridValues = array(
        '_page' => 1,            // display the first page (default = 1)
        '_sort_order' => 'ASC', // reverse order (default = 'ASC') ... ASC or DESC
        '_sort_by' => 'trademark'  // name of the ordered field
    );

    protected function configureFormFields(FormMapper $form)
    {
        $form
            ->with('Crear un nuevo código de barras')
            ->add('type', 'codeType', array('label' => 'Tipo'))
            ->add('code', null, array('label' => 'Código'))
            //->add('creationDate', null, array('label' => 'Fecha de creación'))
            //->add('lastModificationDate', null, array('label' => 'Fecha de última actualización'))
            ->add('trademark', null, array('label' => 'Marca que corresponde este código'))
            ->setHelps(array(
                'type'=>'Introduce el tipo de código',
                'code'=>'Introduce el código',
                'trademark' =>'Selecciona la marca que corresponde este código',
            ))
            ->end();
    }

    protected function configureListFields(ListMapper $list)
    {
        $list
            ->addIdentifier('type')
            ->add('code')
            ->add('creationDate')
            ->add('lastModificationDate')
            ->add('trademark')
            ->add('_action', 'actions', array(
                'actions' => array(
                    'show' => array(),
                    'edit' => array(),
                    'delete' => array(),
                )
            ))
        ;
    }

    protected function configureShowFields(ShowMapper $filter)
    {
        $filter
            ->add('type', 'string', array())
            ->add('code')
            ->add('creationDate')
            ->add('lastModificationDate')
            ->add('trademark')
        ;
    }

    protected function configureDatagridFilters( DatagridMapper $filter )
    {
        $filter
            ->add('type', null, array(
                    'label'=> 'Tipo'),
                null, array(
                    'constraints' => array()
                )
            )
            ->add('code')
            ->add('creationDate')
            ->add('lastModificationDate')
            ->add('trademark')
        ;
    }
}