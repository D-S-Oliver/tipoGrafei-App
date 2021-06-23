//
//  ViewController.swift
//  CaciqueAppZero
//
//  Created by Bruno Neves Oliveira on 15/06/21.
//


import UIKit

class TableViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var footer: FooterSearchBar!
    @IBOutlet weak var footerBottomConstraint: NSLayoutConstraint!
    
    var concepts: [TypeConcept] = []
    var filteredConcepts : [TypeConcept] = []
    var selectedIndex: Int = 0
    let searchController = UISearchController(searchResultsController: nil)
    var isSearchBarEmpty: Bool {
        return searchController.searchBar.text?.isEmpty ?? true
    }
    var isFiltering: Bool {
        let searchBarScopeIsFiltering = searchController.searchBar.selectedScopeButtonIndex != 0
        return searchController.isActive && (!isSearchBarEmpty || searchBarScopeIsFiltering)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        concepts.append(TypeConcept(title: "Léxico Tipográfico", text: "A tipografia tem um vasto léxico que descreve toda a sua diversidade. \n\nA seguir, estão apresentados alguns desses termos tipográficos\n\n", color: .systemBackground, image: UIImage(named: "lexico") ?? UIImage() ))
        concepts.append(TypeConcept(title: "Cor Tipográfica", text: "A Cor Tipográfica refere-se à quantidade de área preenchida pela cor de um texto em relação a um mesmo espaço, tendo como parâmetros a densidade dos  distintos caracteres e pesos.\n\n Assim, quanto maior o peso, mais denso será o texto e, portanto, mais cor haverá. Utilizar fontes com Negrito ou Black (e variantes) resultará  numa presença mais pronunciada na página.\n\n A combinação de letra, espaçamento entre as palavras (ou espacejamento) e as linhas resulta na Cor tipográfica."))
        concepts.append(TypeConcept(title: "Alinhamento", text: "Para dar diferentes tratamentos e apresentações horizontais, o texto pode ser posicionado de diferentes modos. Este texto está alinhado ao topo e à esquerda do bloco de texto.\n\nEste texto está centralizado verticalmente ao corpo da página. \n\nEste texto está alinhado ao mesmo tempo à direita e abaixo do bloco de texto. \n\nPodemos justificar horizontal e verticalmente esse texto para forçá-lo a se distribuir por maior parte do espaço disponível."))
        concepts.append(TypeConcept(title: "Espacejamento: Entrelinhas", text: "Existe um espacejamento adicional, que é aquele feito entre as linhas (entrelinhas) de um texto.\n\nO entrelinhas de corpo é o espaço padrão produzido por cada fonte de forma que as letras acima e abaixo não se toquem. (100% espacejamento)\n\nValores negativos de entrelinhas podem ser usados, sobrepondo linhas.\n\nJá o uso abusivo de grande espaço entrelinhas dificulta a leitura eficiente pelo olho humano, e esse espaço em branco subjuga a presença e a cor do texto. (200%)"))
        concepts.append(TypeConcept(title: "Espacejamento: Entre as letras", text: "Tracking é o nome que se dá ao espacejamento entre as letras, comprimindo-as ou extendendo as palavras do texto, (que pode ficar desarticulado).\n\n\n\nO espaço entre as palavras varia muito de acordo com o meio: num livro será maior, num jornal mais reduzido.\n\nNote que todo alinhamento justificado automaticamente varia o espaço entre palavras, distribuindo-as para preencher ao longo dos limites horizontais.\n\n\n\nKerning é uma forma de diminuir pequenos espaços vazios entre alguns pares de letras, note a mudança:\n\nVA LT AT LV (sem Kerning)\n\nVA LT AT LV (com Kerning)"))
        concepts.append(TypeConcept(title: "Escrita Medieval", text: "A escrita medieval parece pesada e difícil de ler, mas só parece: legibilidade tem a ver com familiaridade. Qualquer leitor da idade média, lendo esse texto... iria tirar de letra! \n\nA esse tipo de escrita “fraturada” ou Gótica dá-se o nome de Fraktur, e foi a que predominou por muitos séculos antes da modernidade. \n\nHoje em dia ainda pode-se ver o eco desse passado quando certificados ou livros de contos de fada usam as iniciais maiúsculas, bastante pronunciadas, no início do texto."))
        concepts.append(TypeConcept(title: "As Serifas", text: "Serifas são aqueles pequenos traços e prolongamentos que vemos no fim das hastes das letras em algumas fontes. Consideradas meramente decorativas, hoje em dia se sabe que, mesmo pouco visíveis, facilitam a leitura, guiando o olho ao longo das linhas. São recomendadas para textos longos.\n\nEm contraste, tipos sem serifas (sans-serif, do francês) irão possuir um visual bastante enxuto e minimalista, mas sua leitura contínua se torna rapidamente cansativa para o olho, sendo portanto uma fonte recomendada apenas para textos curtos.\nTítulos, cabeçalhos, notas de rodapé e legendas são usos ideais."))
        concepts.append(TypeConcept(title: "Cursiva e Symbol", text: "Tipos de letras cursivos buscam imitar a caligrafia manual, que foi a base da escrita humana por muitos séculos, seja por pena e tinta, canetas-tinteiro e até pincéis.\n\nA tipologia Symbol agrega todas as fontes que não se enquadraram nas outras classificações, tais como fontes decorativas, Display e Experimentais."))
        
        filteredConcepts = concepts
        tableView.delegate = self
        tableView.dataSource = self
        
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Quer buscar TIPO o quê?"
        navigationItem.searchController = searchController
        definesPresentationContext = true
    }
}

extension TableViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        filteredConcepts = concepts.filter { conceito in
            guard let searchText = searchController.searchBar.text else {
                return false
            }
            if searchText.isEmpty{
                filteredConcepts = concepts
                return true
            } else {
                return conceito.title.range(of: searchText, options: .caseInsensitive) != nil
            }
        }
        tableView.reloadData()
    }
}

extension TableViewController: UITableViewDelegate{
    private func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) -> Int {
        
        selectedIndex = indexPath.item
        print("selectedIndex1 = ", selectedIndex)
        print("indexPath1 = ", indexPath.item)
        
        performSegue(withIdentifier: "presentDetailSegue", sender: self)
        if isFiltering {
            footer.setIsFilteringToShow(filteredItemCount: filteredConcepts.count, of: concepts.count)
            return filteredConcepts.count
        }
        footer.setNotFiltering()
        return concepts.count
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let detailVC = segue.destination as? DetailViewController
        else {return}
        
        print("selectedIndex2 = ", selectedIndex)
        detailVC.conceito = concepts[selectedIndex]
        print("selectedIndex3 = ", selectedIndex)
    }
}

    
    extension TableViewController: UITableViewDataSource {
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            
            if isFiltering {
                footer.setIsFilteringToShow(filteredItemCount: filteredConcepts.count, of: concepts.count)
                return filteredConcepts.count}
            
            footer.setNotFiltering()
            return concepts.count
        }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableCells", for: indexPath)
        
        cell.textLabel?.text = filteredConcepts[indexPath.item].title
        return cell}
    }




    
    

    
//    func handleKeyboard(notification: Notification) {
//
//      guard notification.name == UIResponder.keyboardWillChangeFrameNotification else {
//        footerBottomConstraint.constant = 0
//        view.layoutIfNeeded()
//        return
//      }
//
//      guard
//        let info = notification.userInfo,
//        let keyboardFrame = info[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue
//        else {
//          return
//      }
//
//      let keyboardHeight = keyboardFrame.cgRectValue.size.height
//      UIView.animate(withDuration: 0.1, animations: { () -> Void in
//        self.footerBottomConstraint.constant = keyboardHeight
//        self.view.layoutIfNeeded()
//      })
//    }

    

        
        //  var isSearchBarEmpty: Bool {
        //        return searchController.searchBar.text?.isEmpty ?? true
        //      }
        //
        //      var isFiltering: Bool {
        //        let searchBarScopeIsFiltering = searchController.searchBar.selectedScopeButtonIndex != 0
        //        return searchController.isActive && (!isSearchBarEmpty || searchBarScopeIsFiltering)
        //      }



    

//    func filterContentSearch


    

